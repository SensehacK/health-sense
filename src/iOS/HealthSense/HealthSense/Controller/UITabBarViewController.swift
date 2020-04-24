//
//  UITabBarViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/20/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class UITabBarViewController: UITabBarController {

    fileprivate func setupUIInit() {
        //TODO: Have different view controller seggregation.
        
        let initText = UILabel()
        initText.text = "Hello Sensehack!"
        initText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(initText)
        
        let xConstraint = NSLayoutConstraint(item: initText, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let YConstraint = NSLayoutConstraint(item: initText, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        
        view.addConstraints([xConstraint, YConstraint])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("In UITab Var VC")
//        view.backgroundColor = Colors.sensehackDarkGrey
//        view.backgroundColor = .darkGray
//        view.backgroundColor = .green
        
//        setupUIInit()
        
        
        
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
