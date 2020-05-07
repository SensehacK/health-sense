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
        
        print("Main viewDidLoad ViewController")

//        commented function for programmatic UI
//        programmaticUI()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        // Dynamic UI Screen Presenter
        if SettingsStruct.defaultScreen == HSRouter.kSummary.rawValue {
            print("Default screen flow")
            let onboardStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewC = onboardStoryboard.instantiateViewController(identifier: "UITabBarViewController")
            viewC.modalPresentationStyle = .fullScreen
            self.present(viewC, animated: false)
            
        } else if SettingsStruct.defaultScreen == "welcome" {
            print("Welcome screen flow")
            let onboardStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
            let viewC = onboardStoryboard.instantiateViewController(identifier: "OnboardingViewController")
            viewC.modalPresentationStyle = .fullScreen
            self.present(viewC, animated: true)
        }
    }
    
    
    fileprivate func programmaticUI() {
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

