//
//  FirstOnboardingViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/24/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class FirstOnboardingViewController: UIViewController {

    @IBOutlet weak var customLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.customLabel.text = UserStruct.displayName ?? "Kautilya"
        print("#### FirstOnboardingVC")
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
