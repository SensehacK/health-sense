//
//  CustomViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/30/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit
import Macaw

class CustomViewController: UIViewController {

//    @IBOutlet weak var macawView: MacawView!
    @IBOutlet weak var macawViewUI: MacawViewUI!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let coder: NSCoder = NSCoder()
        
        // Do any additional setup after loading the view.
        // Calling UI
        programmaticUI()
//        macawViewUI.contentMode = .scaleAspectFit
        
        // https://github.com/exyte/Macaw/wiki/Getting-started#text
//        macawViewUI = MacawViewUI(coder: coder)
        
        
//        macawView = MacawViewUI(coder: coder)!
//        view.addSubview(macawViewUI)
        
    }
    
    
    fileprivate func programmaticUI() {
        view.backgroundColor = HSColors.sensehackDarkGrey
        // Trying out UI using coding.
        let initText = UILabel()
        initText.text = "Hello Sensehack!"
        
        //NOTE: Just due to one method not being falsed the rest of the programmatic constraint wasn't working
        initText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(initText)
        
        let xConstraint = NSLayoutConstraint(item: initText, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let YConstraint = NSLayoutConstraint(item: initText, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        
        view.addConstraints([xConstraint, YConstraint])
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
