//
//  SettingsViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/22/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var appOpenLabel: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var appOpenNumber: UILabel!
    
    // Switch Outlets
    @IBOutlet weak var isRandomUserName: UISwitch!
    @IBOutlet weak var isSecurityEnabled: UISwitch!
    @IBOutlet weak var isDarkMode: UISwitch!
    
    // func to initialize the Settings UI
    fileprivate func setupUI() {
        print(SettingsStruct.isDarkMode)
        print("App run how many times: \(AnalyticsStruct.appOpen)")
        creditLabel.text = "Made with 💚 by Kautilya"
        settingButton.setTitle(HSSenseMotivationQuotes.kSensehack1.rawValue, for: .normal)
        appOpenNumber.text = "\(AnalyticsStruct.appOpen) times"
        isRandomUserName.isOn = SettingsStruct.isRandomUserName
        isSecurityEnabled.isOn = SettingsStruct.isSecurity
        isDarkMode.isOn = SettingsStruct.isDarkMode
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("##### Settings VC")
        // Updated UI with corresponding settings
        setupUI()
    }
    
    
    @IBAction func toggleRandomUser(_ sender: UISwitch) {
        print("toggleRandomUser")
        if sender.isOn {
            SettingsStruct.isRandomUserName = true
        } else {
            SettingsStruct.isRandomUserName = false
        }
        Settings.sharedInstance.setRandomUserName()
        
    }
    
    
    @IBAction func toggleSecurity(_ sender: UISwitch) {
        print("toggleSecurity")
        if sender.isOn {
            SettingsStruct.isSecurity = true
        } else {
            SettingsStruct.isSecurity = false
        }
        Settings.sharedInstance.setSecurity()
    }
    
    
    @IBAction func toggleDarkMode(_ sender: UISwitch) {
        print("toggleSecurity")
        if sender.isOn {
            SettingsStruct.isDarkMode = true
        } else {
            SettingsStruct.isDarkMode = false
        }
        Settings.sharedInstance.setDarkMode()
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
