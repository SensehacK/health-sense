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
    
    // Switch Outlets
    @IBOutlet weak var isRandomUserName: UISwitch!
    @IBOutlet weak var isSecurityEnabled: UISwitch!
    @IBOutlet weak var isDarkMode: UISwitch!
    @IBOutlet weak var isAnalyticsEnabled: UISwitch!
    
    // Credit Stack
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var appVersion: UILabel!
    
    // App Info links
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var projectLink: UIButton!
    @IBOutlet weak var issueLink: UIButton!
    
    // Main Quote
    @IBOutlet weak var programmerQuote: UILabel!
    @IBOutlet weak var programmerAuthor: UILabel!
    
    // func to initialize the Settings UI
    fileprivate func setupUI() {
        print(SettingsStruct.isDarkMode)
        print("App run how many times: \(AnalyticsStruct.appOpen)")
        creditLabel.text = "Made with 💚 by Kautilya"
        appOpenNumber.text = "\(AnalyticsStruct.appOpen) times"
        isRandomUserName.isOn = SettingsStruct.isRandomUserName
        isSecurityEnabled.isOn = SettingsStruct.isSecurity
        isDarkMode.isOn = SettingsStruct.isDarkMode
        isAnalyticsEnabled.isOn = !SettingsStruct.isAnalytics
        
        // Randomize Quotes
        quoteLabel.isUserInteractionEnabled = true
        projectLink.setTitle("Code link⌨️", for: .normal)
        issueLink.setTitle("Submit an Issue🐞", for: .normal)
        randomQuote()
        getProgrammerQuotes()
        getAppVersion()
        
        // Hide View
        analyticsView.isHidden = !(SettingsStruct.isAnalytics ? true : false)
//        appOpenLabel.isHidden = !SettingsStruct.isAnalytics ? true : false
//        appOpenNumber.isHidden = !SettingsStruct.isAnalytics ? true : false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("##### Settings VC")
        // Updated UI with corresponding settings
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Settings View did Appear")
        getProgrammerQuotes()
        randomQuote()
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
    
    // TODO: Move these functions to Network Class
    func getProgrammerQuotes() {
        
        //        let quote = Quotes(idI: 1, quote: "Be Yourself!", author: "Kautilya")
        //        print("Quote: ", quote)
        
        let urlString = "https://programming-quotes-api.herokuapp.com/quotes/random/lang/en"
        
        guard let url = URL(string: urlString) else { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            print("Your response here")
            
            guard let data = data else { return }
            
            // Old method
            /*
             do {
             guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
             print(json)
             print(json["author"])
             
             } catch let error {
             print(error)
             }
             
             */
            
            
            do {
                let json = try JSONDecoder().decode(Quotes.self, from: data)
                print(json.en!)
                print(json.author!)
                DispatchQueue.main.async {
                    self.programmerQuote.text = json.en!
                    self.programmerAuthor.text = "-\(json.author!)"
                }
                
            } catch let error {
                print(error)
            }
            
        }.resume()
        
        
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
