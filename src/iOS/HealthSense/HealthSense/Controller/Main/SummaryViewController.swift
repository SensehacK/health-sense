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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var chartLabel: UILabel!
    @IBOutlet weak var viewChartButton: UIButton!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var bloodType: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    
    // Variables declaration
    let user = UserStruct.displayName ?? "Sensehack"
    let healthKitManager = HealthKitManager.sharedInstance
    var profileMObj: ProfileM?
    
    fileprivate func initialSetup() {
        // Debug Logs
        print("##### SummaryViewController VDL")

        print("Display Name \(UserStruct.displayName ?? "Kautilya")")
        print("Base URL", Settings.sharedInstance)
        print("Singleton", Settings.sharedInstance.appVersion)
        print("Dark mode s ? \(SettingsStruct.isDarkMode)")
        print("Settings Static variables.", Settings.saf)
        print("Dark mode e after  ? \(SettingsStruct.isDarkMode)")
        
        // Setting some details to Constant structures
        SettingsStruct.isDarkMode = true
        UserStruct.displayName = user
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // func for small init setup
        initialSetup()
        
        // Healthkit permissions
        healthAuthorization()
        
        // Profile data calls
        readProfileData()
    }
    
    
    @IBAction func chartButtonPressed(_ sender: Any) {
        print("Button Chart Button pressed")
        
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
            }
            print("Was healthkit successful? \(success)")
        }
    }
    
    fileprivate func readProfileData() {
        // Profile Age function call
        let dob = ReadProfile.sharedInstance.getDOB()
        ageLabel.text = "Age: \(dob)"
        
        // Profile Blood group function call
        let bloodT = ReadProfile.sharedInstance.getBloodType()
        bloodType.text = "Blood: \(bloodT)"
        
        // Profile Gender function call
        let gender = ReadProfile.sharedInstance.getGender()
        chartLabel.text = "Gender: \(gender)"
        
        // Profile Device Name function call
        let userDeviceName = ReadProfile.sharedInstance.getProfileName()
        userTitle.text = "Welcome \(userDeviceName)"
        
        
        if SettingsStruct.isRandomUserName {
            // Profile preselected array Random user name generator function call
            UserStruct.displayName = ReadProfile.sharedInstance.getRandomUserName()
        } else {
            UserStruct.displayName = ReadProfile.sharedInstance.getProfileName()
        }
        if let displayName = UserStruct.displayName {
            userTitle.text = "Welcome \(displayName)"
        }
        
        
        // Body Weight function call
        let helperObj = Helper()
        helperObj.readBodyMassWithComp { (quantity, error) in
            guard error == nil else { return print("Error in: \(String(describing: error))") }
            if let bodyWeight = quantity {
                let usersWeight: Double = bodyWeight.doubleValue(for: HKUnit.pound())
                UserStruct.weight = usersWeight
                DispatchQueue.main.async {
                    self.chartLabel.text = "Weight: \(String(describing: usersWeight))"
                }
            }
        }
        
        helperObj.readHeight { (quantity, error) in
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
         if segue.identifier == "SummaryChildSegue" {
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
        let onboardStoryboard = UIStoryboard(name: "CustomViewController", bundle: nil)
        let viewC = onboardStoryboard.instantiateViewController(identifier: "CustomViewController")
        viewC.modalPresentationStyle = .fullScreen
        self.present(viewC, animated: true)
    }
    
    // function for performing storyboard segue to Child view controller
    func segueToSummaryChildVC() {
        performSegue(withIdentifier: "SummaryChildSegue", sender: self)
    }
    

}
