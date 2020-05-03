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
    @IBOutlet weak var macawViewBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func macawViewButton(_ sender: Any) {
//         setupMacawStoryboard() // Calling Macaw VC
//         setupUI()
        navigateToBarChartVC() // Calling Macaw BarChart
    }
    
    
    @IBAction func welcomeButton(_ sender: Any) {
        print("welcome button pressed")
        performSegue(withIdentifier: "goToOnboarding", sender: self)
    }
    
    
    
    func setupUI() {
        let customVC = CustomViewController()
//        self.presentingViewController?.addChild(customVC)
        self.present(customVC, animated: true, completion: nil)
    }
    
    // function to invoke Macaw UIView for some reason manual setupUI() can't invoke Macaw in CustomViewController() class customUIInvoke() function
    func setupMacawStoryboard() {
        let onboardStoryboard = UIStoryboard(name: "CustomViewController", bundle: nil)
        let viewC = onboardStoryboard.instantiateViewController(identifier: "CustomViewController")
        viewC.modalPresentationStyle = .fullScreen
        self.present(viewC, animated: true)
    }
    
    // function for programmatically navigating to BarChart view controller storyboard
    func navigateToBarChartVC() {
        // Storyboard Invocation without any Identifier
        let barChartStoryboard = UIStoryboard(name: "BarChart", bundle: nil)
        let barChartVC = barChartStoryboard.instantiateInitialViewController()
        barChartVC?.modalPresentationStyle = .fullScreen
        if let barchart = barChartVC {
            self.present(barchart, animated: true)
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
