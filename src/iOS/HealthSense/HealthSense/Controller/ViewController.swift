//
//  ViewController.swift
//  HealthSense
//
//  Created by Sensehack on 3/24/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let healthKitManager = HealthKitManager.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hi viewDidLoad ViewController")
        view.backgroundColor = HSColors.sensehackDarkGrey
        
        
        // Trying out UI using coding.
        let initText = UILabel()
        initText.text = "Hello Sensehack!"
        //NOTE: Just due to one method not being falsed the rest of the programmatic constraint wasn't working
        initText.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(initText)
               
        let xConstraint = NSLayoutConstraint(item: initText, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let YConstraint = NSLayoutConstraint(item: initText, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
               
        view.addConstraints([xConstraint, YConstraint])
        
        // Do any additional setup after loading the view.
        healthKitManager.authorizeHealthKit { (success, error) in
            
            if let error = error {
                print("Error in healthkit access \(error)")
            }
            print("Was healthkit successful? \(success)")
        }
        
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if SettingsStruct.defaultScreen == "welcome2" {
            let onboardStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
            let viewC = onboardStoryboard.instantiateViewController(identifier: "OnboardingViewController")
            print("Hi if  did appear running 2")
            
            self.present(viewC, animated: true)
        } else {
            let onboardStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewC = onboardStoryboard.instantiateViewController(identifier: "UITabBarViewController")
            print("Hi else view")
            viewC.modalPresentationStyle = .fullScreen
            self.present(viewC, animated: false)
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "onboarding" {
            
            /* Manually presenting the View controller segue with fullscreen. But it throws stack error saying Storyboard can't find FirstOnboardingVC & also Console log warning message.
            let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
            let myVC = storyboard.instantiateViewController(withIdentifier: "FirstOnboardingVC")
            myVC.modalPresentationStyle = .fullScreen
            self.present(myVC, animated: true, completion: nil)
            */
        }
    }


}

