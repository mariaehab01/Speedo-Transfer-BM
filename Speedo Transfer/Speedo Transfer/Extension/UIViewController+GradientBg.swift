//
//  UIViewController+GradientBg.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 06/09/2024.
//

import Foundation
import UIKit

extension UIViewController {
    
    func applyGradientBackground(colors: [CGColor] = [
        UIColor(hex: "#FFFFFF").cgColor,
        UIColor(hex: "#FFEAEE").cgColor
    ]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = view.bounds
        gradientLayer.name = "gradientLayer"
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func updateGradientFrame() {
        if let gradientLayer = view.layer.sublayers?.first(where: { $0.name == "gradientLayer" }) as? CAGradientLayer {
            gradientLayer.frame = view.bounds
        }
    }
}
