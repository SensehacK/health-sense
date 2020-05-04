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
    private let backgroundColors = [
        0.2,
        0.14,
        0.07
        ].map {
            Color.rgba(r: 255, g: 255, b: 255, a: $0)
    }
    private let gradientColors = [
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
    private let extent = [
        4.0,
        2.0,
        3.0
    ]
    private let radius = [
        90.0,
        70.0,
        50.0
    ]
    
    private func createArc(_ time: Double, _ index: Int) -> Shape {
        return Shape(
            form: Arc(
                ellipse: Ellipse(cx: 0, cy: 0, rx: self.radius[index], ry: self.radius[index]),
                shift: 5.0,
                extent: self.extent[index] * time),
            stroke: Stroke(
                fill: gradientColors[index],
                width: 19,
                cap: .round
            )
        )
    }
    
    private func createScene() {
        let viewCenterX = Double(self.frame.width / 2)
        
        let text = Text(
            text: "Daily Summary",
            font: Font(name: "Serif", size: 24),
            fill: Color(val: 0xFFFFFF)
        )
        text.align = .mid
        text.place = .move(dx: viewCenterX, dy: 30)
        
        let rootNode = Group(place: .move(dx: viewCenterX, dy: 200))
        
        for index in 0...2 {
            let circle = Shape(
                form: Circle(cx: 0, cy: 0, r: radius[index]),
                stroke: Stroke(fill: backgroundColors[index], width: 19)
            )
            rootNode.contents.append(circle)
        }
        
        animationGroup = Group()
        rootNode.contents.append(animationGroup)
        
//        self.node = [text, rootNode].group()
        self.node = rootNode
        self.backgroundColor = UIColor(cgColor: Color(val: 0x4a2e7d).toCG())
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
        createScene()
        createAnimations()
        animations.forEach {
            $0.play()
        }
    }
    
    
}
