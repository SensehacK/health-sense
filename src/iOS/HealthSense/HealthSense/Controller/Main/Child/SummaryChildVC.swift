//
//  SummaryChildVC.swift
//  HealthSense
//
//  Created by Sensehack on 5/1/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class SummaryChildVC: UIViewController {

    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var titleObj: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("#### SummaryChildVC")
//        titleLabel.text = "SummaryChild VC"
        print("titleLabel.text before \(titleLabel.text)")
        titleLabel.text = titleObj ?? "Summary"
        print("titleLabel.text after \(titleLabel.text)")
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
