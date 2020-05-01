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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("##### Settings VC")
        print(SettingsStruct.isDarkMode)
        creditLabel.text = "Made with 💚 by Kautilya"
        print("App run how many times: \(AnalyticsStruct.appOpen)")
        appOpenLabel.text = "App ranned:\(AnalyticsStruct.appOpen)times"
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
