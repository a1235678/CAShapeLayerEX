//
//  ShadowView.swift
//  CAShapeLayerEX
//
//  Created by zeroplus on 2019/9/19.
//  Copyright © 2019 zeroplus. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ShadowView: UIView {
    
    let grayColor = UIColor.init(displayP3Red: 223/255, green: 220/255, blue: 215/255, alpha: 1).cgColor
    
    // when view bounds changes
    override func layoutSubviews() {
        print("ShadowView - ", #function)
        super.layoutSubviews()
       // drawView()
        
    }

    override func draw(_ rect: CGRect) {
        print("ShadowView - ", #function)
        super.draw(rect)
        drawView()
        //drawViewWithMask()
    }
    
    private func drawView() {
        let maxX = self.bounds.maxX
        let maxY = self.bounds.maxY
        let minX = self.bounds.minX
        let minY = self.bounds.minY
        let aDegree = CGFloat.pi / 180
        let cornerRadius: CGFloat = 2
        let lineYPosition: CGFloat = 40
        let angleWidth: CGFloat = 7
        
        self.backgroundColor = UIColor.init(displayP3Red: 250/255, green: 249/255, blue: 242/255, alpha: 1)
        
        let path = UIBezierPath(arcCenter: CGPoint(x: minX + cornerRadius, y: minY + cornerRadius), radius: cornerRadius, startAngle: aDegree * 180, endAngle: aDegree * 270, clockwise: true)
        path.addLine(to: CGPoint(x: maxX - cornerRadius, y: minY))
        path.addArc(withCenter: CGPoint(x: maxX - cornerRadius, y: minY + cornerRadius), radius: cornerRadius, startAngle: aDegree * 270, endAngle: aDegree * 0, clockwise: true)
        path.addLine(to: CGPoint(x: maxX, y: minY + (lineYPosition - angleWidth)))
        path.addLine(to: CGPoint(x: maxX - angleWidth, y: minY + lineYPosition))
        path.addLine(to: CGPoint(x: maxX, y: minY + (lineYPosition + angleWidth)))
        path.addLine(to: CGPoint(x: maxX, y: maxY - cornerRadius))
        path.addArc(withCenter: CGPoint(x: maxX - cornerRadius, y: maxY - cornerRadius), radius: cornerRadius, startAngle: aDegree * 0, endAngle: aDegree * 90, clockwise: true)
        path.addLine(to: CGPoint(x: minX + cornerRadius, y: maxY))
        path.addArc(withCenter: CGPoint(x: minX + cornerRadius, y: maxY - cornerRadius), radius: cornerRadius, startAngle: aDegree * 90, endAngle: aDegree * 180, clockwise: true)
        path.addLine(to: CGPoint(x: minX, y: minY + (lineYPosition + angleWidth)))
        path.addLine(to: CGPoint(x: minX + angleWidth, y: minY + lineYPosition))
        path.addLine(to: CGPoint(x: minX, y: minY + (lineYPosition - angleWidth)))
        path.close()
        
        let borderLayer = CAShapeLayer()
        borderLayer.fillColor = UIColor.white.cgColor // 若想為透明可設為 nil
        // 線條寬度
        borderLayer.lineWidth = 1
        // 線條顏色
        borderLayer.strokeColor = grayColor

        borderLayer.path = path.cgPath
        addShadow(borderLayer)
        
        //containerView.layer.insertSublayer(borderLayer, below: <#T##CALayer?#>)
        self.layer.addSublayer(borderLayer)
        
        let lineLayer = CAShapeLayer()
        lineLayer.fillColor = grayColor
        lineLayer.path = CGPath(rect: CGRect(x: angleWidth * 2, y: lineYPosition, width: self.bounds.width - angleWidth * 4, height: 1), transform: .none)
        self.layer.addSublayer(lineLayer)
        
//        lineLayer.zPosition = 15
//        borderLayer.zPosition = 10
        
        self.backgroundColor = UIColor.clear
        
    }
    
    func drawViewWithMask() {
        let maxX = self.bounds.maxX
        let minX = self.bounds.minX
        let cornerRadius: CGFloat = 2
        let lineYPosition: CGFloat = 40
        let angleWidth: CGFloat = 7
        
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius)
        
        let leftTriPath = UIBezierPath()
        var point = CGPoint(x: minX, y: lineYPosition - angleWidth)
        leftTriPath.move(to: point)
        point = CGPoint(x: minX + angleWidth, y: lineYPosition)
        leftTriPath.addLine(to: point)
        point = CGPoint(x: minX, y: lineYPosition + angleWidth)
        leftTriPath.addLine(to: point)
        leftTriPath.close()
        path.append(leftTriPath)
        
        let rightTriPath = UIBezierPath()
        point = CGPoint(x: maxX, y: lineYPosition - angleWidth)
        rightTriPath.move(to: point)
        point = CGPoint(x: maxX - angleWidth, y: lineYPosition)
        rightTriPath.addLine(to: point)
        point = CGPoint(x: maxX, y: lineYPosition + angleWidth)
        rightTriPath.addLine(to: point)
        rightTriPath.close()
        path.append(rightTriPath)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillRule = .evenOdd
        shapeLayer.path = path.cgPath
//        shapeLayer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        //self.layer.mask = shapeLayer
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = path.cgPath
        borderLayer.fillRule = .evenOdd
        borderLayer.fillColor = UIColor.white.cgColor
        borderLayer.strokeColor = grayColor
        borderLayer.lineWidth = 1
        borderLayer.mask = shapeLayer
        self.layer.addSublayer(borderLayer)
        
        addShadow(self.layer)
    }
    
    private func addShadow(_ layer: CALayer) {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.7
    }
}
