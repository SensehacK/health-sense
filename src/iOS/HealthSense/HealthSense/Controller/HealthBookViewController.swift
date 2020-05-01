//
//  HealthBookViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/22/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class HealthBookViewController: UIViewController {

    
    @IBOutlet weak var mainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func welcomeButton(_ sender: Any) {
        print("welcome button pressed")
//        performSegue(withIdentifier: "goToOnboarding", sender: self)
        setupUI()
    }
    
    func setupUI() {
        
        let customVC = CustomViewController()
//        self.presentingViewController?.addChild(customVC)
        self.present(customVC, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        print("In prepare Segue method", segue)
    }
    

}
