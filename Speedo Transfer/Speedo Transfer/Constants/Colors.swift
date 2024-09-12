//
//  Colors.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 06/09/2024.
//

import Foundation
import UIKit

struct Colors {
    static let primaryColor = UIColor(hex: "#521220")
    static let lightGrayColor = UIColor(hex: "#B0AFAE")
    static let grayColor = UIColor(hex: "#898886")
    static let blackGrayColor = UIColor(hex: "#24221E")
    static let LightYellowColor = UIColor(hex: "#FFF8E7")
    static let LightRedColor = UIColor(hex: "#FFEAEE")
    static let white = UIColor(hex: "#FFFFFF")
    static let textFieldBorderColor = UIColor(hex: "#B0AFAE")
    static let backBtnColor = UIColor(hex: "#24221E")
    static let countryCellColor = UIColor(hex: "#F3E9EB")
    static let placeHolderColor = UIColor(hex: "#3C3A37")
    static let NormalTabBarColor = UIColor(hex: "#7C7A78")
    static let TappedColor = UIColor(hex: "#871E35")
    
    // MARK: - Gradient
    static var whiteRedGradient: CAGradientLayer {
        let gl = CAGradientLayer()
        gl.colors = [white.cgColor, LightRedColor.cgColor]
        gl.locations = [0.0, 0.75]
        return gl
    }
    
    static var yellowRedGradient: CAGradientLayer {
        let gl = CAGradientLayer()
        gl.colors = [LightYellowColor.cgColor, LightRedColor.cgColor]
        gl.locations = [0.0, 1.0]
        return gl
    }
}
