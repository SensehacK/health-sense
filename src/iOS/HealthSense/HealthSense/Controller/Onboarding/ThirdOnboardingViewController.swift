//
//  ThirdOnboardingViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/24/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class ThirdOnboardingViewController: UIViewController {

    let healthKitManager = HealthKitManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("#### ThirdOnboardingVC")
    }
    
    @IBAction func continueBtnPressed(_ sender: Any) {
        // Do any additional setup after loading the view.
        healthKitManager.authorizeHealthKit { (success, error) in
            
            if let error = error {
                print("Error in healthkit access \(error)")
            }
            print("Was healthkit successful? \(success)")
        }
        
        print("Button continue pressed ThirdOnboardingVC")
        
        if SettingsStruct.defaultScreen == "welcome" {
            SettingsStruct.defaultScreen = "default"
            let onboardStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewC = onboardStoryboard.instantiateViewController(identifier: "UITabBarViewController")
            print("continueBtnPressed ")
            viewC.modalPresentationStyle = .fullScreen
            self.present(viewC, animated: true)
            
        } else if SettingsStruct.defaultScreen == "default" {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
