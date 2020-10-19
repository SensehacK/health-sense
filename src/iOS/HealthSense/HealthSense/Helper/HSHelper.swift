//
//  HSHelper.swift
//  HealthSense
//
//  Created by Sensehack on 5/11/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import UIKit

class HSHelper: UIViewController {
    
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
        
        print("Hello alert controller")
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

    
    
}
