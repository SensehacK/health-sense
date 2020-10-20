//
//  CustomViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/30/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit
import Macaw
import HealthKit
import HealthKitUI

class CustomViewController: UIViewController {

    @IBOutlet weak var macawViewUI: MacawViewUI!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var activityView: HKActivityRingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // customUIInvoke() // Fails nil value
        // programmaticUI() // Shows programmatic UI but no MacawView
        retrieveActivitySummary2()
    }
    
    
    // Custom UI programmatic invocation
    fileprivate func customUIInvoke() {
        programmaticUI()
        macawViewUI?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(macawViewUI)
        
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
    
    func retrieveActivitySummary2() {
        
        // Heart Rate function call
        let activityObj = ReadActivity()
        activityObj.readActivity{(quantity, error) in
            
            guard error == nil else {
                return print("Error in \(String(describing: error))")
            }
            
            guard let summary = quantity?.first else { return }
//            self.customHealth(data: summary)
            ///*
            DispatchQueue.main.async {
                if let activityView = self.activityView{
                    activityView.setActivitySummary(summary, animated: false)
                }
//                self.activityView.setActivitySummary(summary, animated: true)
            }
// */
        }
    }
    
    func customHealth(data: HKActivitySummary) {
        // Create the view with a size of 200x200
        let frame    = CGRect(x: 0, y: 500, width: 200, height: 200)
        let ringView = HKActivityRingView(frame: frame)

        // Assume we're in a UIViewController with a self.view property.
        DispatchQueue.main.async {
        self.view.addSubview(ringView)
        
        // Update the view to display the current summary
        ringView.setActivitySummary(data, animated: true)
        }
    }

    @IBAction func doneButton(_ sender: Any) {
        print("Done button pressed in Custom VC")
        // Navigate to main parent view controller from where this child VC got invoked
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
