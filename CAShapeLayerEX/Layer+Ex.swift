//
//  Layer+Ex.swift
//  CAShapeLayerEX
//
//  Created by zeroplus on 2019/9/19.
//  Copyright © 2019 zeroplus. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    fileprivate static let gradientLayerKey = "GradientEffectsLayer"
    
    enum RenderDirection: Int {
        case top
        case bottom
        case left
        case right
        var point: CGPoint {
            switch self {
            case .top:          return CGPoint(x: 0.5, y: 0)
            case .bottom:       return CGPoint(x: 0.5, y: 1)
            case .left:         return CGPoint(x: 0, y: 0.5)
            case .right:        return CGPoint(x: 1, y: 0.5)
            }
        }
    }
    
    private var gradient: CALayer? {
        return sublayers?.first { $0.name == CALayer.gradientLayerKey }
    }
    
    func removeGradient() {
        gradient?.removeFromSuperlayer()
    }
    
    func updateGradient(rect: CGRect?) {
        gradient?.frame = rect ?? bounds
    }
    
    func renderGradient(from: RenderDirection, to: RenderDirection, colors: [UIColor]) {
        // 初始化漸層效果
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = from.point
        gradientLayer.endPoint   = to.point
        gradientLayer.frame      = bounds
        gradientLayer.colors     = colors.map { $0.cgColor }
        gradientLayer.name       = CALayer.gradientLayerKey
        
        if let layer = gradient {
            replaceSublayer(layer, with: gradientLayer)
        } else {
            insertSublayer(gradientLayer, at: 0)
        }
    }
}
