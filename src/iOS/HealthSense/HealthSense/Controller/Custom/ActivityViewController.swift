//
//  ActivityViewController.swift
//  HealthSense
//
//  Created by Sensehack on 10/19/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit
import Macaw
import HealthKit
import HealthKitUI

class ActivityViewController: UIViewController {

    //@IBOutlet weak var activityView: HKActivityRingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // customUIInvoke() // Fails nil value
        // programmaticUI() // Shows programmatic UI but no MacawView
        retrieveActivitySummary2()
        print("Hello ActivityViewController")
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    

    
    func retrieveActivitySummary2() {
        
        // Heart Rate function call
        let activityObj = ReadActivity()
        activityObj.readActivity{(quantity, error) in
            
            guard error == nil else {
                return print("Error in \(String(describing: error))")
            }
            
            guard let summary = quantity?.first else { return }
            self.customHealth(data: summary)
            /*
            DispatchQueue.main.async {
                if let activityView = self.activityView{
                    activityView.setActivitySummary(summary, animated: false)
                }
//                self.activityView.setActivitySummary(summary, animated: true)
            }
 */
        }
    }
    
    func customHealth(data: HKActivitySummary) {
        // Create the view with a size of 200x200
        let frame    = CGRect(x: 0, y: 100, width: 200, height: 200)
        let ringView = HKActivityRingView(frame: frame)
        
        // Assume we're in a UIViewController with a self.view property.
        DispatchQueue.main.async {
            self.view.addSubview(ringView)
        
            // Update the view to display the current summary
            ringView.setActivitySummary(data, animated: true)
        }
    }



}
