//
//  BarChart.swift
//  HealthSense
//
//  Created by Sensehack on 5/3/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation
import Macaw

class BarChart: MacawView {
    
    static let lastFiveDummyData                = DummyData.createDummyData2()
    static let maxValue: Double                  = 100
    static let maxValueLineHeight: Double        = 200
    static let lineWidth: Double                = 275
    static let xAxisWidth: Double               = 300
    static let yAxisWidth: Double               = 330
    
    
    // Math
    static let dataDivisor              = maxValue/maxValueLineHeight
    
    static let adjustedData: [Double]   = lastFiveDummyData.map({ $0.ddCount / dataDivisor })
    static var animations: [Animation]  = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: BarChart.createChart(), coder: aDecoder)
        backgroundColor = .lightGray
    }

    private static func createChart() -> Group {
        var items: [Node] = addYAxisItems() + addXAxisItems()
        items.append(createBars())
        
        return Group(contents: items, place: .identity)
    }
    
    private static func addYAxisItems() -> [Node] {
        let maxLines            = 10
        let lineInterval        = Int(maxValue) / maxLines
        let yAxisHeight: Double = 330
        let lineSpacing: Double = 30
        
        var newNodes: [Node]    = []
        
        for index in 1...maxLines {
            let yValue = yAxisHeight - (Double(index) * lineSpacing)
            
            let valueLine = Line(x1: -5, y1: yValue, x2: lineWidth, y2: yValue).stroke(fill: Color.white.with(a: 0.10))
            let valueText = Text(text: "\(index * lineInterval)", align: .max, baseline: .mid, place: .move(dx: -10, dy: yValue))
            valueText.fill = Color.white
             
            newNodes.append(valueText)
            newNodes.append(valueLine)
        }
        
        // Line Outliner
        let yAxis = Line(x1: 0, y1: 0, x2: 0, y2: yAxisHeight).stroke(fill: Color.white.with(a: 0.25))
        newNodes.append(yAxis)
        
        return newNodes
    }
    
    private static func addXAxisItems() -> [Node] {
        let chartBaseY: Double      = 300
        var newNodes: [Node]        = []
        
        
        for index in 1...adjustedData.count {
            let xAxisIndent = (Double(index) * 50)
            let valueText = Text(text: lastFiveDummyData[index - 1].ddNumber, fill: Color.white, align: .max, baseline: .mid, place: .move(dx: xAxisIndent, dy: chartBaseY + 15))
            newNodes.append(valueText)
            print("Printing out adjustedData:  \(adjustedData[index-1]) ")
        }
        
        // Line Outliner
        let xAxis = Line(x1: 0, y1: chartBaseY, x2: lineWidth, y2: chartBaseY).stroke(fill: Color.white.with(a: 0.25))
        newNodes.append(xAxis)
        
        return newNodes
    }
    
    private static func createBars() -> Group {
        let fillLinearGradient = LinearGradient(degree: 90, from: Color(val: 0xff4704), to: Color(val: 0xff4704).with(a: 0.33))
        let items = adjustedData.map { _ in Group() }
        
        animations = items.enumerated().map { (index: Int, item: Group) in
            item.contentsVar.animation(delay: Double(index) * 0.1) { time in
                // Calculate rectangle height for that specific animation frame HeightTotal = 50 (f1 -> h(10),f2 -> h(20),f3 -> h(30) ....) till 0.1 -> 1.0
                let height = adjustedData[index] * time
                // Animating Rectanges with Time and changing Y axis depending from time 0.1 -> 1.0
                let rectangle = Rect(x: Double(index) * 50 + 25, y: 300 - height, w: 30, h: height)
                return [rectangle.fill(with: fillLinearGradient)]
            }
        }
        return items.group()
    }
    
    
    static func playAnimations() {
        animations.combine().play()
    }
    
    
    private static func createDummyData() -> [DummyData] {
        let one = DummyData(number: "242", count: 45)
        let two = DummyData(number: "35", count: 21)
        let three = DummyData(number: "11", count: 74)
        let four = DummyData(number: "56", count: 57)
        let five = DummyData(number: "46", count: 24)

        return [one, two, three, four, five]
    }
}
