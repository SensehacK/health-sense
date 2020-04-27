//
//  SummaryViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/22/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var chartLabel: UILabel!
    @IBOutlet weak var viewChartButton: UIButton!
    
    
    // Variables declaration
    let user = UserStruct.displayName ?? "Sensehack"
    let healthKitManager = HealthKitManager.sharedInstance
    
    // Get user details from User
//    let userObj = User(firstName: "Kautilya", lastName: "Save", age: 24)
//    Profile.user = userObj
//
    
    
    
    
    fileprivate func initialSetup() {
        
        //        view.backgroundColor = Colors.sensehackDarkGrey
        // Debug Logs
        print("SummaryViewController VDL")
        
        print("Display Name \(UserStruct.displayName ?? "Kautilya")")
        print("Base URL", Settings.sharedInstance)
        print("Singleton", Settings.sharedInstance.appVersion)
        print("Dark mode s ? \(SettingsStruct.isDarkMode)")
        print("Settings Static variables.", Settings.saf)
        print("Dark mode e after  ? \(SettingsStruct.isDarkMode)")
        
        
        SettingsStruct.isDarkMode = true
        // Setting userDisplay Name to Profile Constant
        UserStruct.displayName = user
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // func for small init setup
        initialSetup()
        
        // Healthkit permissions
        healthAuthorization()
        
    }
    
    
    @IBAction func chartButtonPressed(_ sender: Any) {
        
        print("Button Chart Button pressed")
        userTitle.text = "Welcome \(user)"
        chartLabel.text = "Kautilya Save"
        
        UserStruct.displayName = chartLabel.text
        
//        print(userObj.firstName)
        self.dismiss(animated: true, completion: nil)
        
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


}
