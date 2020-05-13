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
   
    // Analytics Stack
    @IBOutlet weak var analyticsView: UIStackView!
    @IBOutlet weak var appOpenLabel: UILabel!
    @IBOutlet weak var appOpenNumber: UILabel!
    
    
    @IBOutlet weak var appearanceSegment: UISegmentedControl!
    
    // Switch Outlets
    @IBOutlet weak var isRandomUserName: UISwitch!
    @IBOutlet weak var isSecurityEnabled: UISwitch!
    @IBOutlet weak var isColorMode: UISwitch!
    @IBOutlet weak var isAnalyticsEnabled: UISwitch!
    
    // Credit Stack
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var appVersion: UILabel!
    
    // App Info links
    @IBOutlet weak var infoStack: UIStackView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var projectLink: UIButton!
    @IBOutlet weak var issueLink: UIButton!
    
    // Main Quote
    @IBOutlet weak var programmerQuote: UILabel!
    @IBOutlet weak var programmerAuthor: UILabel!
    
    // func to initialize the Settings UI
    fileprivate func setupUI() {
        print("App run how many times: \(AnalyticsStruct.appOpen)")
        
        // Setup Settings UI
        uiSwitch()
        
        // Randomize Quotes
        quoteLabel.isUserInteractionEnabled = true
        appInfo() // Set app info
        getAppVersion() // set app version
        
        // Analytics
        analyticsView.isHidden = !(SettingsStruct.isAnalytics ? true : false)
        appOpenNumber.text = "\(AnalyticsStruct.appOpen) times"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("##### Settings VC")
        // Updated UI with corresponding settings
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Settings View will Appear")
        getProgrammerQuotes()
        randomQuote()
        getCredit() // set credit
        // Dark Mode On/Off
        overrideUserInterfaceStyle = SettingsStruct.isDarkMode ? .dark : .light
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Settings View did Appear")
    }
    
    
    @IBAction func appearanceChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            overrideUserInterfaceStyle = .light
            SettingsStruct.isDarkMode = false
        case 1:
            overrideUserInterfaceStyle = .dark
            SettingsStruct.isDarkMode = true
        default:
            overrideUserInterfaceStyle = .unspecified
        }
        Settings.sharedInstance.setDarkMode()
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
        print("toggleDarkMode")
        if sender.isOn {
            SettingsStruct.isDarkMode = true
            overrideUserInterfaceStyle = .dark
        } else {
            SettingsStruct.isDarkMode = false
            overrideUserInterfaceStyle = .light
        }
        Settings.sharedInstance.setDarkMode()
    }
    
    @IBAction func toggleAnalytics(_ sender: UISwitch) {
        print("toggleAnalytics")
        if sender.isOn {
            SettingsStruct.isAnalytics = false
        } else {
            SettingsStruct.isAnalytics = true
        }
        Settings.sharedInstance.setAnalytics()
    }
    
    func randomQuote() {
        quoteLabel.text = HSSenseMotivationQuotes.allCases.randomElement().map { $0.rawValue }
    }
    
    @IBAction func labelTap(_ sender: UITapGestureRecognizer) {
        print("Tapped")
        randomQuote()
    }
    
    // TODO: Main programmer label tap
    @IBAction func mainLabelTap(_ sender: UITapGestureRecognizer) {
        print("Main Tapped")
        getProgrammerQuotes()
    }
    
    @IBAction func openLink(_ sender: Any) {
        if let url = URL(string: HSAppLinks.kAppCode.rawValue) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func submitIssue(_ sender: Any) {
        if let url = URL(string: HSAppLinks.kAppBug.rawValue) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    // TODO: Move these functions to Network Class
    func getProgrammerQuotes() {
//        let urlString = "https://programming-quotes-api.herokuapp.com/quotes/random/lang/en"
        guard let url = URL(string: HSAPI.kAPIProgrammerQuote.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == HSHttpStatusCode.kStatusSuccess.rawValue else {
                print("Error in retrieving text")
                DispatchQueue.main.async {
                    self.programmerQuote.text = HSErrorMsg.kErrorNetwork.rawValue
                    self.programmerAuthor.isHidden = true
                }
                return
            }
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(Quotes.self, from: data)
                print(json.en!)
                print(json.author!)
                DispatchQueue.main.async {
                    self.programmerAuthor.isHidden = false
                    self.programmerQuote.text = json.en!
                    self.programmerAuthor.text = "-\(json.author!)"
                }
            } catch let error {
                print(error)
            }
        }.resume()
        
    }
    
    fileprivate func uiSwitch() {
        isRandomUserName.isOn = SettingsStruct.isRandomUserName
        isSecurityEnabled.isOn = SettingsStruct.isSecurity
        isColorMode.isOn = SettingsStruct.isColorMode
        isAnalyticsEnabled.isOn = !SettingsStruct.isAnalytics
        appearanceSegment.selectedSegmentIndex  = SettingsStruct.isDarkMode ? 1 : 0
    }
    
    fileprivate func appInfo() {
        infoStack.backgroundColor = UIColor(named: "Link")
        projectLink.setTitle("Code link⌨️", for: .normal)
        issueLink.setTitle("Submit an Issue🐞", for: .normal)
    }
    
    // TODO: Credit label tap
    func getCredit() {
        creditLabel.text = "Made with 💚 by Kautilya"
        guard let emojiHeart = HSHeartEmoji.allCases.randomElement().map({ $0.rawValue }) else { return }
        guard let teamMember = HSTeam.allCases.randomElement().map({ $0.rawValue }) else { return }
        print("Made with \(HSHeartEmoji.kEmoji3.rawValue) by \(HSTeam.kTeam3.rawValue)")
        creditLabel.text = "Made with \(emojiHeart) by \(teamMember)"
    }
    
    // TODO: Move these functions to HSHelper Class
    func getAppVersion() {
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return }
        guard let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else { return }
        self.appVersion.text = "v\(String(describing: appVersion))#\(String(describing: buildNumber))"
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
