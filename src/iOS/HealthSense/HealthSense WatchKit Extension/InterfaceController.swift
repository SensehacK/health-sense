//
//  InterfaceController.swift
//  HealthSense WatchKit Extension
//
//  Created by Sensehack on 3/24/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var heartRateLabel: WKInterfaceLabel!
    
    @IBOutlet weak var workoutButton: WKInterfaceButton!
    
    var isWorkoutInProgress = false
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    @IBAction func didButtonTap() {
        print("Button tapped")
        if isWorkoutInProgress {
            print("End Workout")
        } else {
            print("Start Workout")
        }
        isWorkoutInProgress = !isWorkoutInProgress
        self.workoutButton.setTitle(isWorkoutInProgress ? "End Workout" : "Start Workout")
        
    }
    
}
