//
//  SummaryViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/22/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var chartLabel: UILabel!
    @IBOutlet weak var viewChartButton: UIButton!
    
    
    // Variables declaration
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("SummaryViewController VDL")
//        view.backgroundColor = Colors.sensehackDarkGrey
        
    }
    
    
    @IBAction func chartButtonPressed(_ sender: Any) {
        
        print("Button Chart Button pressed")
        userTitle.text = "Welcome \(user)"
        chartLabel.text = "Kautilya Save"
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
