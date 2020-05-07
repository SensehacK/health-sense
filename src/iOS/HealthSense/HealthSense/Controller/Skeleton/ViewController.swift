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
        
        print("#### Main viewDidLoad ViewController")
        if UserDefaults.standard.bool(forKey: HSUserDefaults.kFirstLaunch.rawValue) {
            print("Default launch")
            Settings.sharedInstance.appRestoreSettings()
        } else {
            print("First launch")
            Settings.sharedInstance.setAppSettings()
        }
        
        Analytics().setup()
//        commented function for programmatic UI
//        programmaticUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("###### viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("###### View Did Appear")
        /* This code flow works if we utilize SceneDelegate
         window?.rootViewController = ViewController()
         -> Loads this class which then loads the respective storyboard "Summary" or "Onboarding"
         By moving our dynamic UI logic in Scene Delegate we removed the blackscreen on launch and
         also calculated which UI to be displayed at the right place.
         */
        // Dynamic UI Screen Presenter
        if SettingsStruct.defaultScreen == HSRouter.kSummary.rawValue {
            print("Default screen flow")
            let onboardStoryboard = UIStoryboard(name: HSStoryboard.kHomeVC.rawValue, bundle: nil)
            let viewC = onboardStoryboard.instantiateViewController(identifier: HSCustomViewController.kTabBarVC.rawValue)
            viewC.modalPresentationStyle = .fullScreen
            self.present(viewC, animated: false)

        } else if SettingsStruct.defaultScreen == HSRouter.kWelcome.rawValue {
            print("Welcome screen flow")
            let onboardStoryboard = UIStoryboard(name: HSStoryboard.kOnboardingVC.rawValue, bundle: nil)
            let viewC = onboardStoryboard.instantiateViewController(identifier: HSCustomViewController.kOnboardingVC.rawValue)
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
        if segue.identifier == HSStoryboardSegue.kOnboardingViewS.rawValue {
            
            /* Manually presenting the View controller segue with fullscreen. But it throws stack error saying Storyboard can't find FirstOnboardingVC & also Console log warning message.
            let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
            let myVC = storyboard.instantiateViewController(withIdentifier: "FirstOnboardingVC")
            myVC.modalPresentationStyle = .fullScreen
            self.present(myVC, animated: true, completion: nil)
            */
        }
    }


}

