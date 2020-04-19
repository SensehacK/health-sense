//
//  InterfaceController.swift
//  HealthSense WatchKit Extension
//
//  Created by Sensehack on 3/24/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var heartRateLabel: WKInterfaceLabel!
    
    @IBOutlet weak var workoutButton: WKInterfaceButton!
    
    let healthKitManager = HealthKitManager.sharedInstance
    
    var isWorkoutInProgress = false
    
    var workoutSession: HKWorkoutSession?
    
    var workOutStartDate: Date?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        self.workoutButton.setEnabled(false)
        
        // Configure interface objects here.
        
        healthKitManager.authorizeHealthKit { (success, error) in
            print("Healthkit successful ?", success)
            self.workoutButton.setEnabled(true)
            self.createWorkoutSession()
        }
        
        
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
            endWorkoutSession()
        } else {
            print("Start Workout")
            startWorkoutSession()
        }
        isWorkoutInProgress = !isWorkoutInProgress
        self.workoutButton.setTitle(isWorkoutInProgress ? "End Workout" : "Start Workout")
        
    }
    
    func createWorkoutSession() {
        
        let workoutConfiguration = HKWorkoutConfiguration()
        workoutConfiguration.activityType = .other
        workoutConfiguration.locationType = .unknown
        
        
        do {
//            workoutSession = try HKWorkoutSession(configuration: workoutConfiguration)
            workoutSession = try HKWorkoutSession(healthStore: self.healthKitManager.healthStore, configuration: workoutConfiguration)
            workoutSession?.delegate = self
        } catch {
            print("Exception thrown")
        }
    }
    
    func startWorkoutSession() {
        if self.workoutSession == nil {
            createWorkoutSession()
        }
        
        guard let session = workoutSession else {
            print("cannot start workout session wihout a workout session")
            return
        }
        
        self.workOutStartDate = Date()
//        healthKitManager.healthStore.start(session)
        
//        session.startActivity(with: Date.init())
        session.startActivity(with: self.workOutStartDate)

                
    }
    
    func endWorkoutSession() {
        guard let session = workoutSession else {
            print("Cannot start workout without a session")
            return
        }
        
        session.end()
        saveWorkoutSession()
        
    }
    
    func saveWorkoutSession() {
        
        guard let startDate = workOutStartDate else {
            return
        }
        
        let workout = HKWorkout(activityType: .other, start: startDate, end: Date())
        
        healthKitManager.healthStore.save(workout) { (success, error) in
            print("Did we save the workout? You Decide!\(success)")
        }
    }
    
}

extension InterfaceController: HKWorkoutSessionDelegate {
    
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        
        print("In workoutsession Interface Controller Delegates")
        switch toState {
        case .running:
            print("workout started")
        case .ended:
            print("workout ended")
        default:
            print("other workout started")
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        print("Workout failed with error \(error)")
    }
    
    
    
    
}
