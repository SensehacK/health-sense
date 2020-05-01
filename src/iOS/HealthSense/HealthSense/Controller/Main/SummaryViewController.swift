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
        
        // Profile Age function call
        let dob = ReadProfile.sharedInstance.getDOB()
        ageLabel.text = "Age: \(dob)"
        
        // Profile Blood group function call
        let bloodT = ReadProfile.sharedInstance.getBloodType()
        bloodType.text = "Blood: \(bloodT)"
        
        // Profile Gender function call
        let gender = ReadProfile.sharedInstance.getGender()
        chartLabel.text = "Gender: \(gender)"
        
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
//                let usersHeight: Int = bodyHeight.doubleValue(for: LengthFormatter.init centimeter)
                let heightCM = HKUnit.init(from: .centimeter)
                let usersHeight: Int = Int(bodyHeight.doubleValue(for: heightCM))
//                HKUnit.init(from: .centimeter)
                UserStruct.height = usersHeight
                DispatchQueue.main.async {
                    self.heightLabel.text = "Height:\(String(describing: usersHeight))cms"
                }
                
            }
        }
        
    }
    
    
    @IBAction func chartButtonPressed(_ sender: Any) {
        
        print("Button Chart Button pressed")
        userTitle.text = "Welcome \(user)"
        chartLabel.text = "Kautilya Save"
        
        UserStruct.displayName = chartLabel.text
        
//        self.dismiss(animated: true, completion: nil)
        navigateToCustomVCStoryboard()
        
    }
    
    
    fileprivate func healthAuthorization() {
        // Do any additional setup after loading the view.
        healthKitManager.authorizeHealthKit { (success, error) in
            
            if let error = error {
                print("Error in healthkit access \(error)")
            }
            print("Was healthkit successful? \(success)")
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func navigateToCustomVCStoryboard() {
        let onboardStoryboard = UIStoryboard(name: "CustomViewController", bundle: nil)
        let viewC = onboardStoryboard.instantiateViewController(identifier: "CustomViewController")
        viewC.modalPresentationStyle = .fullScreen
        self.present(viewC, animated: true)
    }
    

}


// Commented code


/*
        //        view.backgroundColor = Colors.sensehackDarkGrey
 
     // Get user details from User
 //    let userObj = User(firstName: "Kautilya", lastName: "Save", age: 24)
 //    Profile.user = userObj
 //
        // Normal helper call
        //        helperObj.readBodyMass()
        //        let weight = UserStruct.weight
        //        chartLabel.text = "Weight: \(String(describing: weight))"
        
        
       // Completion handler call
       
       func completed(quantity: HKQuantity?, error: Error?) {
       print("In function completed completion handler")
       let weightUnit = HKUnit.pound()
       if let bodyWeight = quantity {
          let usersWeight: Double = bodyWeight.doubleValue(for: weightUnit)
           UserStruct.weight = usersWeight
           DispatchQueue.main.async {
               self.chartLabel.text = "Weight: \(String(describing: usersWeight))"
           }
           
       }
       }

*/
