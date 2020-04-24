//
//  ThirdOnboardingViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/24/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class ThirdOnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueBtnPressed(_ sender: Any) {
        print("Button continue pressed")
        self.dismiss(animated: true, completion: nil)
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
