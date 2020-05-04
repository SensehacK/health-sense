//
//  BarChartViewController.swift
//  HealthSense
//
//  Created by Sensehack on 5/3/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class BarChartViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChart!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        barChartView.contentMode = .scaleAspectFit
        BarChart.playAnimations()
    }
    

    @IBAction func doneButton(_ sender: Any) {
        print("Done button pressed in Bar Chart VC")
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func reloadView(_ sender: Any) {
        BarChart.playAnimations()
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
