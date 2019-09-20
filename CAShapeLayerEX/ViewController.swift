//
//  ViewController.swift
//  CAShapeLayerEX
//
//  Created by zeroplus on 2019/9/3.
//  Copyright © 2019 zeroplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var closeButton: CloseButton!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBAction func layoutIfNeededButtonClicked(_ sender: Any) {
        
        enlargeButton()
        closeButton.layoutIfNeeded()
        addGradient()
    }
    
    @IBAction func setNeedsLayoutButtonClicked(_ sender: Any) {
        
        enlargeButton()
        closeButton.setNeedsLayout()
        addGradient()
        
    }
    
    @IBAction func enlargeButtonClicked(_ sender: Any) {
        enlargeButton()
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = closeButton.bounds
        
        let dark = #colorLiteral(red: 0.2651053071, green: 0.1684348583, blue: 0.7054899335, alpha: 1).cgColor
        let light = #colorLiteral(red: 0.7299370766, green: 0.4124585092, blue: 0.8224056959, alpha: 1).cgColor
        
        gradientLayer.colors = [dark, light]
        gradientLayer.locations = [0, 0.8, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        closeButton.layer.addSublayer(gradientLayer)
    }
    
    private func enlargeButton() {
        widthConstraint.constant = widthConstraint.constant + 20
        heightConstraint.constant = heightConstraint.constant + 20
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("ViewController - ", #function)
        //addGradient()
    }

}

