//
//  UIViewController+GradientBg.swift
//  Speedo Transfer
//
//  Created by Maria Ehab 
//

import Foundation
import UIKit

extension UIViewController {

    // MARK: - Gradient Background Methods
    func applyGradientBgYellowToRed() {
        let gradientLayer = Colors.yellowRedGradient
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func applyGradientBgWhiteToRed() {
        let gradientLayer = Colors.whiteRedGradient
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
