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
        5.0,
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

        super.init(node: CircularPieChart.createChart() , coder: aDecoder)
        backgroundColor = .clear
    }
    
    
    private static func createChart() -> Group {
        let shape1 = Shape(
            form: Arc(
                ellipse: Ellipse(cx: 0, cy: 0, rx: self.radius[0], ry: self.radius[0]),
                shift: 5.0,
                extent: self.extent[0]),
            stroke: Stroke(
                fill: gradientColors[0],
                width: 19,
                cap: .round
        ))
        let shape2 = Shape(
            form: Arc(
                ellipse: Ellipse(cx: 0, cy: 0, rx: self.radius[1], ry: self.radius[1]),
                shift: 5.0,
                extent: self.extent[1]),
            stroke: Stroke(
                fill: gradientColors[1],
                width: 19,
                cap: .round
        ))
        
        let shape3 = Shape(
            form: Arc(
                ellipse: Ellipse(cx: 0, cy: 0, rx: self.radius[2], ry: self.radius[2]),
                shift: 5.0,
                extent: self.extent[2]),
            stroke: Stroke(
                fill: gradientColors[2],
                width: 19,
                cap: .round
        ))
        
        
        let items: [Node] = createScene() + [shape1, shape2, shape3]
        return Group(contents: items, place: .identity)
    }
    
    private func createArc(_ time: Double, _ index: Int) -> Shape {
        return Shape(
            form: Arc(
                ellipse: Ellipse(cx: 0, cy: 0, rx: CircularPieChart.radius[index], ry: CircularPieChart.radius[index]),
                shift: 5.0,
                extent: CircularPieChart.extent[index] * time),
            stroke: Stroke(
                fill: CircularPieChart.gradientColors[index],
                width: 19,
                cap: .round
            )
        )
    }
    

    private static func createScene() -> [Node] {
//        viewCenterX = viewCenterX window.
        var newNodes: [Node]        = []
        let rootNode = Group(place: .move(dx: viewCenterX + 15, dy: 150))
        
        for index in 0...2 {
            let circle = Shape(
                form: Circle(cx: 0, cy: 0, r: CircularPieChart.radius[index]),
                stroke: Stroke(fill: backgroundColors[index], width: 19)
            )
            newNodes.append(circle)
            rootNode.contents.append(circle)
        }
        
        return newNodes
        /*
        
        animationGroup = Group()
//        rootNode.contents.append(animationGroup)
        
        self.node = [rootNode].group()
        self.backgroundColor = UIColor(cgColor: Color(val: 0x4a2e7d).toCG())
         */
    }
    
    private func createAnimations() {
        animations.removeAll()
        animations.append(
            animationGroup.contentsVar.animation({ time in
                var shapes1: [Shape] = []
                for index in 0...2 {
                    shapes1.append(self.createArc(time, index))
                }
                return  shapes1
            }, during: 1).easing(Easing.easeInOut)
        )
    }
    
    open func playAnimation() {
        CircularPieChart.createScene()
        createAnimations()
        animations.forEach {
            $0.play()
        }
    }
    
    
}
