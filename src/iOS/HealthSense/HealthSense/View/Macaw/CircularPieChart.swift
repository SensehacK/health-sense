//
//  CircularPieChart.swift
//  HealthSense
//
//  Created by Sensehack on 5/3/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import Macaw

class CircularPieChart: MacawView {
    
    private var animationGroup = Group()
    
    private var animations = [Animation]()
    static let backgroundColors = [
        0.2,
        0.14,
        0.07
        ].map {
            Color.rgba(r: 255, g: 255, b: 255, a: $0)
    }
    static let gradientColors = [
        (top: 0xfc087e, bottom: 0xff6868),
        (top: 0x06dfed, bottom: 0x03aafe),
        (top: 0xffff5c, bottom: 0xffa170)
    ].map {
        LinearGradient(
            degree: 90,
            from: Color(val: $0.top),
            to: Color(val: $0.bottom)
        )
    }
    static let extent = [
        3.0,
        2.0,
        3.0
    ]
    static let radius = [
        150.0,
        130.0,
        110.0
    ]
    
    static var viewCenterX: Double = 350.0
    
    required init?(coder aDecoder: NSCoder) {

        super.init(node: CircularPieChart.createChart(), coder: aDecoder)
        backgroundColor = .clear
    }
    
    
    private static func createChart() -> Group {
        // Combining Nodes to create Node array which would be assigned to Group Scene
        let items: [Node] = createBackgroundScene() + createArcWithoutAnimations()
        return Group(contents: items, place: .identity)
    }
    
    private static func createArcWithoutAnimations() -> [Node] {
        var newNodes: [Node] = []
        for index in 0...2 {
            let arc = Shape(
                form: Arc(
                    ellipse: Ellipse(cx: 0, cy: 0, rx: self.radius[index], ry: self.radius[index]),
                    shift: 5.0,
                    extent: self.extent[index]),
                stroke: Stroke(
                    fill: gradientColors[index],
                    width: 19,
                    cap: .round
            ))
            newNodes.append(arc)
        }
        return newNodes
    }
    
    
    private static func createBackgroundScene() -> [Node] {
        var newNodes: [Node] = []
        for index in 0...2 {
            let circle = Shape(
                form: Circle(cx: 0, cy: 0, r: CircularPieChart.radius[index]),
                stroke: Stroke(fill: backgroundColors[index], width: 19)
            )
            newNodes.append(circle)
        }
        return newNodes
    }

    
}
