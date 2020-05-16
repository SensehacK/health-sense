//
//  SummaryViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/22/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit
import HealthKit

class SummaryViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var circularChartView: CircularPieChart!
    @IBOutlet weak var chartView: UIView!
    

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var bloodType: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
   
    @IBOutlet weak var viewChartButton: UIButton!
    
    
    
    // Variables declaration
    let user = UserStruct.displayName ?? "Sensehack"
    let healthKitManager = HealthKitManager.sharedInstance
    var profileMObj: ProfileM?
    
    fileprivate func initialSetup() {
        // Debug Logs
        print("##### SummaryViewController VDL")
        print("Display Name \(UserStruct.displayName ?? "Kautilya")")
        print("Singleton", Settings.sharedInstance.appVersion)
    }
    

    fileprivate func userInterfaceStyle() {
        switch UIScreen.main.traitCollection.userInterfaceStyle {
        case .light: //light mode
            print("Light mode")
        case .dark: //dark mode
            print("dark mode")
        case .unspecified: //the user interface style is not specified
            print("unspecified mode")
        @unknown default:
            print("Unknown mode")
        }
        overrideUserInterfaceStyle = SettingsStruct.isDarkMode ? .dark : .light
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // func for small init setup
        initialSetup()
        // User Interface style
        userInterfaceStyle()
        // Healthkit permissions
        healthAuthorization()
        // Settings Aspect fit for Chart View
        circularChartView.contentMode = .scaleAspectFit
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("Summary View will Appear")
        overrideUserInterfaceStyle = SettingsStruct.isDarkMode ? .dark : .light
        generateGreetings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Summary View did Appear")
        readProfileData() // Profile data call
    }
    
    
    @IBAction func chartButtonPressed(_ sender: Any) {
        print("Button Chart Button pressed")
//        displayAlert()
        // Navigate to
        segueToSummaryChildVC()  // Child VC
        // navigateToCustomVCStoryboard() // Macaw VC
    }
    
    // healthkit singleton function
    fileprivate func healthAuthorization() {
        // Do any additional setup after loading the view.
        healthKitManager.authorizeHealthKit { (success, error) in
            if let error = error {
                print("Error in healthkit access \(error)")
                self.displayAlert()
            }
            print("Was healthkit successful? \(success)")
            DispatchQueue.main.async {
                // Profile data call
                self.readProfileData()
            }
        }
    }
    
    func displayAlert() {
        
        let permissionMessage = """
        The App won't function properly without permissions, Please open Settings app -> Privacy and allow Health Permissions?
        """
        
        // create the alert
        let alert = UIAlertController(title: "HealthKit Permission", message: permissionMessage, preferredStyle: UIAlertController.Style.alert)

        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Open Settings", style: UIAlertAction.Style.default, handler: { (_) in
            print("Continue settings")
            self.openSettings()
        }))
        alert.addAction(UIAlertAction(title: "Deny", style: UIAlertAction.Style.cancel, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func openSettings() {
        
//        if let url = URL(string: "App-Prefs:root=General") {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
        UIApplication.shared.open(URL(string: "App-prefs:Privacy&path=HEALTH")!)
//        if let appSettings = URL(string: UIApplication.openSettingsURLString) {
//            UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
//        }
    }
    
    fileprivate func generateGreetings() {
        // Profile Device Name logic
        if SettingsStruct.isRandomUserName {
            // Profile preselected array Random user name generator function call
            UserStruct.displayName = ReadProfile.sharedInstance.getRandomUserName()
        } else {
            // Profile Device Name function call
            UserStruct.displayName = ReadProfile.sharedInstance.getProfileName()
        }
        
        if let displayName = UserStruct.displayName {
            userTitle.text = "Welcome \(displayName)"
            UserStruct.firstName = UserStruct.displayName
        }
    }
    
    fileprivate func readProfileData() {
        // Profile Age function call
        let dob = ReadProfile.sharedInstance.getDOB()
        if dob == 0 {
            print("DOB = 0")
            Alert.displayHealthPermissionAlert2(viewC: self)
        }
        ageLabel.text = "Age: \(dob)"
        
        // Profile Blood group function call
        let bloodT = ReadProfile.sharedInstance.getBloodType()
        bloodType.text = "Blood: \(bloodT)"
        
        // Profile Gender function call
        let gender = ReadProfile.sharedInstance.getGender()
        genderLabel.text = "Gender: \(gender)"
        
//        generateGreetings() // Calling in viewWill appear
        
        
        // Body Weight function call
        let bodyObj = ReadBody()
        bodyObj.readBodyMassWithComp { (quantity, error) in
            guard error == nil else { return print("Error in: \(String(describing: error))") }
            if let bodyWeight = quantity {
                let usersWeight: Double = bodyWeight.doubleValue(for: SettingsStruct.isMetric ? HKUnit.gramUnit(with: .kilo) : HKUnit.pound())
                DispatchQueue.main.async {
                    self.weightLabel.text = SettingsStruct.isMetric ? usersWeight.formatWeightKg() : usersWeight.formatWeightLb()
                }
            }
        }
        
        // Body Height function call
        bodyObj.readHeight { (quantity, error) in
            guard error == nil else { return print("Error in: \(String(describing: error))") }
            if let bodyHeight = quantity {
                let heightCM = HKUnit.init(from: .centimeter)
                let usersHeight: Int = Int(bodyHeight.doubleValue(for: heightCM))
                UserStruct.height = usersHeight
                DispatchQueue.main.async {
                    self.heightLabel.text = "Height: \(String(describing: usersHeight))cms"
                }
            }
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == HSStoryboardSegue.kSummaryS.rawValue {
            print("Showing Summary Child Segue")
            // Object data passing to child view controller
            
            self.profileMObj = ProfileM(
                firstN: UserStruct.firstName ?? "Anon",
                lastN: UserStruct.lastName ?? "Anon",
                age: UserStruct.age ?? 0,
                blood: UserStruct.blood ?? "Unknown",
                gender: UserStruct.gender ?? "Unknown",
                weight: UserStruct.weight ?? 0,
                height: UserStruct.height ?? 0)
            
            if let destVC = (segue.destination as? SummaryChildVC) {
                print("In segue destination")
                destVC.titleObj  = "Kautilya"
                destVC.profileMObj = self.profileMObj
            }
        }
    }
    
    // function for programmatically navigating to Custom view controller storyboard
    func navigateToCustomVCStoryboard() {
        let onboardStoryboard = UIStoryboard(name: HSStoryboard.kCustomVC.rawValue, bundle: nil)
        let viewC = onboardStoryboard.instantiateViewController(identifier: HSCustomViewController.kCustomVC.rawValue)
        viewC.modalPresentationStyle = .fullScreen
        self.present(viewC, animated: true)
    }
    
    // function for performing storyboard segue to Child view controller
    func segueToSummaryChildVC() {
        performSegue(withIdentifier: HSStoryboardSegue.kSummaryS.rawValue, sender: self)
    }
    
}
