//
//  Alert.swift
//  HealthSense
//
//  Created by Sensehack on 5/15/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
    static func showAlert(viewC: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            viewC.present(alert, animated: true, completion: nil)
        }
    }
    
    static func showAlert2(viewC: UIViewController, title: String, buttonString: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonString, style: .default, handler: {(_) in
            print("Continue settings")
            openSettings()
        }))
        alert.addAction(UIAlertAction(title: "Deny", style: .destructive, handler: nil))
        DispatchQueue.main.async {
            viewC.present(alert, animated: true, completion: nil)
        }
    }
    
    static func displayHealthPermissionAlert(viewC: UIViewController) {
        
        let permissionMessage = """
        The App won't function properly without permissions, Please open Settings app -> Privacy and allow Health Permissions?
        """
        // show the alert
        showAlert(viewC: viewC, title: "HealthKit Permission", message: permissionMessage)
    }
    
    static func displayHealthPermissionAlert2(viewC: UIViewController) {
        let permissionMessage = """
        The App won't function properly without permissions, Please open Settings app -> Privacy and allow Health Permissions?
        """
        // show the alert
        showAlert2(viewC: viewC, title: "HealthKit Permission", buttonString: "Open Settings", message: permissionMessage)
    }
    
    static func openSettings() {
            UIApplication.shared.open(URL(string: "App-prefs:Privacy&path=HEALTH")!)
        }
    
    
}
