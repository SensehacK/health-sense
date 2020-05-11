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
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var appOpenNumber: UILabel!
    
    // Switch Outlets
    @IBOutlet weak var isRandomUserName: UISwitch!
    @IBOutlet weak var isSecurityEnabled: UISwitch!
    @IBOutlet weak var isDarkMode: UISwitch!
    
    
    // Info sharing
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var projectLink: UIButton!
    @IBOutlet weak var issueLink: UIButton!
    
    // func to initialize the Settings UI
    fileprivate func setupUI() {
        print(SettingsStruct.isDarkMode)
        print("App run how many times: \(AnalyticsStruct.appOpen)")
        creditLabel.text = "Made with 💚 by Kautilya"
        appOpenNumber.text = "\(AnalyticsStruct.appOpen) times"
        isRandomUserName.isOn = SettingsStruct.isRandomUserName
        isSecurityEnabled.isOn = SettingsStruct.isSecurity
        isDarkMode.isOn = SettingsStruct.isDarkMode
        
        // Randomize Quotes
        quoteLabel.isUserInteractionEnabled = true
        projectLink.setTitle("Code link⌨️", for: .normal)
        issueLink.setTitle("Submit an Issue🐞", for: .normal)
        randomQuote()
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
    
    func randomQuote() {
        quoteLabel.text = HSSenseMotivationQuotes.allCases.randomElement().map { $0.rawValue }
    }
    
    @IBAction func changeQuote(_ sender: Any) {
        randomQuote()
    }
    
    @IBAction func labelTap(_ sender: UITapGestureRecognizer) {
        print("Tapped")
        randomQuote()
    }
    
    @IBAction func openLink(_ sender: Any) {
        if let url = URL(string: "https://github.com/SensehacK/health-sense") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func submitIssue(_ sender: Any) {
        if let url = URL(string: "https://github.com/SensehacK/health-sense/issues") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
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
