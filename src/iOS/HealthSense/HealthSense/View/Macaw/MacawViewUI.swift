//
//  MacawView.swift
//  HealthSense
//
//  Created by Sensehack on 4/30/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import Macaw

class MacawViewUI: MacawView {
    
    required init?(coder aDecoder: NSCoder) {
        
        let text = Text(text: "Hello Sensehack 123!", place: .move(dx: 145, dy: 100))
        super.init(node: text, coder: aDecoder)
        self.backgroundColor = UIColor.yellow
        
    }
    
    
}

// Link: https://github.com/exyte/Macaw/wiki/Getting-started#text
