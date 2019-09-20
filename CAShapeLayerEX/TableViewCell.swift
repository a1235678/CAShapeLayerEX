//
//  TableViewCell.swift
//  CAShapeLayerEX
//
//  Created by zeroplus on 2019/9/19.
//  Copyright © 2019 zeroplus. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var gradientView: UIView!
    
    let gradientLayer = CAGradientLayer()
    let barLayer = CAShapeLayer()
    let dark = UIColor.blue
    let light = UIColor.cyan
    
    var currentValue: Double = 0 {
        didSet {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = 2.0
            barLayer.strokeEnd = CGFloat(currentValue/100)
            barLayer.add(animation, forKey: "stroke")
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        barLayer.strokeEnd = 0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        gradientView.layer.borderColor = UIColor.black.cgColor
//        gradientView.layer.borderWidth = 1
//        setUpGradient()
//        gradientView.layer.addSublayer(gradientLayer)
        
        
        //gradientView.layer.renderGradient(from: .left, to: .right, colors: [dark, light])
        //setUpBar()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //setUpGradient()
        setUpBar()
        //barLayer.strokeEnd = 0
        
        
        
        //gradientView.layer.updateGradient(rect: gradientView.bounds)
    }

    private func setUpGradient() {
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [dark, light].map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
    
    private func setUpBar() {
        let barLayer = CAShapeLayer()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: gradientView.bounds.height/2))
        path.addLine(to: CGPoint(x: gradientView.bounds.width, y: gradientView.bounds.height/2))
        barLayer.path = path.cgPath
        barLayer.lineWidth = 20
        barLayer.fillColor = nil
        barLayer.strokeColor = dark.cgColor
        barLayer.lineCap = .round
        barLayer.strokeEnd = 0
        //let animation = CABasicAnimation(keyPath: "strokeEnd")
        //animation.duration = 2.0
        //barLayer.add(animation, forKey: "stroke")
        
        gradientView.layer.addSublayer(barLayer)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
