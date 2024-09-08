//
//  UIViewController+GradientBg.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 06/09/2024.
//

import Foundation
import UIKit

extension UIViewController {

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
