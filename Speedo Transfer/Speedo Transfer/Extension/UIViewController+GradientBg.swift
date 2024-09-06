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
        UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor,
        UIColor(red: 1.0, green: 0.917, blue: 0.933, alpha: 1.0).cgColor
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
    
    public func printSystemFonts() {
        // Use this identifier to filter out the system fonts in the logs.
        let identifier: String = "[SYSTEM FONTS]"
        // Here's the functionality that prints all the system fonts.
        for family in UIFont.familyNames as [String] {
            debugPrint("\(identifier) FONT FAMILY :  \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                debugPrint("\(identifier) FONT NAME :  \(name)")
            }
        }
    }
}
