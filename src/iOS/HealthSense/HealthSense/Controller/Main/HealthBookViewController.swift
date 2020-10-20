//
//  HealthBookViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/22/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit
import HealthKit
import HealthKitUI

class HealthBookViewController: UIViewController {

    
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var macawViewBtn: UIButton!
    @IBOutlet weak var barChartView: BarChart!
    @IBOutlet weak var activityView: HKActivityRingView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Invoking Bar Chart View with Scaling
        barChartView.contentMode = .scaleAspectFit
        BarChart.playAnimations()
//        retrieveActivitySummary()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("HealthBook View will Appear")
        overrideUserInterfaceStyle = SettingsStruct.isDarkMode ? .dark : .light
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("HealthBook View did Appear")
//        overrideUserInterfaceStyle = SettingsStruct.isDarkMode ? .dark : .light
    }
    
    @IBAction func macawViewButton(_ sender: Any) {
         setupMacawStoryboard() // Calling Macaw VC
//        setupActivityStoryboard()
//         setupUI()
    }
    
    
    @IBAction func welcomeButton(_ sender: Any) {
        print("welcome button pressed")
        performSegue(withIdentifier: HSStoryboardSegue.kOnboardingS.rawValue, sender: self)
    }
    
    
    @IBAction func barChartButton(_ sender: Any) {
         print("Bar button pressed")
         navigateToBarChartVC() // Calling Macaw BarChart
    }
    
    @IBAction func pieChartButton(_ sender: Any) {
        print("Pie button pressed")
        navigateToPieChartVC() // Calling Macaw PieChart
    }
    
    
    func setupUI() {
        let customVC = CustomViewController()
//        self.presentingViewController?.addChild(customVC)
        self.present(customVC, animated: true, completion: nil)
    }
    
    func retrieveActivitySummary() {
        
        // Heart Rate function call
        let activityObj = ReadActivity()
        activityObj.readActivity{(quantity, error) in
            
            print("activityObj.readActivityin")
            guard error == nil else {
                return print("Error in \(String(describing: error))")
            }
            
            guard let summary = quantity?.first else { return }
            
            DispatchQueue.main.async {
//                if let activityView = self.activityView{
//                    activityView.setActivitySummary(summary, animated: false)
//                }
                self.activityView.setActivitySummary(summary, animated: true)
            }
        }
        
        /*
        // Heart Rate function call
        let heartObj = ReadHeart()
        heartObj.readHeartRate { (quantity, error) in
            guard error == nil else {
                return print("Error in \(String(describing: error))")
            }
            let unit = HKUnit(from: HSHealthKitUnits.kHeartRate.rawValue)
            let latestHeartRate = (quantity?.doubleValue(for: unit))!
            print("Latest HR: \(latestHeartRate)")
            UserStruct.heartRate = latestHeartRate
            DispatchQueue.main.async {
                self.heightLabel.text = "Heart Rate: \(String(describing: latestHeartRate))counts/min"
            }
        }
         */
    }
    
    
    // function to invoke Macaw UIView for some reason manual setupUI() can't invoke Macaw in CustomViewController() class customUIInvoke() function
    func setupMacawStoryboard() {
        let onboardStoryboard = UIStoryboard(name: HSStoryboard.kCustomVC.rawValue, bundle: nil)
        let viewC = onboardStoryboard.instantiateViewController(identifier: HSCustomViewController.kCustomVC.rawValue)
        viewC.modalPresentationStyle = .fullScreen
        self.present(viewC, animated: true)
    }
    
    func setupActivityStoryboard() {
        let onboardStoryboard = UIStoryboard(name: HSStoryboard.kActivity.rawValue, bundle: nil)
        let viewC = onboardStoryboard.instantiateViewController(identifier: HSCustomViewController.kActivityVC.rawValue)
        viewC.modalPresentationStyle = .fullScreen
        self.present(viewC, animated: true)
    }
    
    // function for programmatically navigating to BarChart view controller storyboard
    func navigateToBarChartVC() {
        // Storyboard Invocation without any Identifier
        let barChartStoryboard = UIStoryboard(name: HSStoryboard.kBarChart.rawValue, bundle: nil)
        let barChartVC = barChartStoryboard.instantiateInitialViewController()
        barChartVC?.modalPresentationStyle = .fullScreen
        if let barchart = barChartVC {
            self.present(barchart, animated: true)
        }
    }
    
    // function for programmatically navigating to BarChart view controller storyboard
    func navigateToPieChartVC() {
        // Storyboard Invocation without any Identifier
        let pieChartStoryboard = UIStoryboard(name: HSStoryboard.kCircularPieChart.rawValue, bundle: nil)
        let pieChartVC = pieChartStoryboard.instantiateInitialViewController()
        pieChartVC?.modalPresentationStyle = .fullScreen
        if let piechart = pieChartVC {
            self.present(piechart, animated: true)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        print("In prepare Segue method", segue)
    }
    

}
