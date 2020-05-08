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
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    
    
    var titleObj: String?
    var profileMObj: ProfileM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("#### SummaryChildVC")
        setupUI()
        
    }

    // func to setup UI with programmatic text on launch
    func setupUI() {
        titleLabel.text = titleObj ?? "Summary"
        print("Profile name \(String(describing: self.profileMObj?.firstName))")
        label1.text = "First Name"
        textField1.text = self.profileMObj?.firstName
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
