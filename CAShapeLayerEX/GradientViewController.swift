//
//  GradientViewController.swift
//  CAShapeLayerEX
//
//  Created by zeroplus on 2019/9/20.
//  Copyright © 2019 zeroplus. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController {
    
    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(gradientLayer)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = view.bounds
        
        let dark = #colorLiteral(red: 0.2651053071, green: 0.1684348583, blue: 0.7054899335, alpha: 1).cgColor
        let light = #colorLiteral(red: 0.7299370766, green: 0.4124585092, blue: 0.8224056959, alpha: 1).cgColor
        let white = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        
        gradientLayer.colors = [dark, light, white]
        gradientLayer.locations = [0, 0.8, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
