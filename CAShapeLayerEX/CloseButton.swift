//
//  CloseButton.swift
//  CAShapeLayerEX
//
//  Created by zeroplus on 2019/9/7.
//  Copyright © 2019 zeroplus. All rights reserved.
//

import UIKit

@IBDesignable
class CloseButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("CloseButton - ", #function)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("CloseButton - ", #function)
        
        layer.cornerRadius = frame.width / 2
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.backgroundColor = UIColor.red.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.7
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("CloseButton - ", #function)
    }

}
