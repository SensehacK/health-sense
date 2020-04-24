//
//  SummaryViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/22/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var chartLabel: UILabel!
    @IBOutlet weak var viewChartButton: UIButton!
    
    
    // Variables declaration
    let user = "Sensehack"
    
    // Get user details from User
//    let userObj = User(firstName: "Kautilya", lastName: "Save", age: 24)
//    Profile.user = userObj
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("SummaryViewController VDL")
//        view.backgroundColor = Colors.sensehackDarkGrey
        
        print("Base URL",Settings.shared().baseURL)
        print("Singleton",Settings.shared())
        print("Dark mode s ? \(SettingsStruct.isDarkMode)")
        SettingsStruct.isDarkMode = true
        print("Dark mode e ? \(SettingsStruct.isDarkMode)")
    }
    
    
    @IBAction func chartButtonPressed(_ sender: Any) {
        
        print("Button Chart Button pressed")
        userTitle.text = "Welcome \(user)"
        chartLabel.text = "Kautilya Save"
        
//        print(userObj.firstName)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
