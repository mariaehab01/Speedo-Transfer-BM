//
//  UIViewController+underline.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 11/09/2024.
//

import UIKit

extension UIButton {
    
    func setUnderlinedTitle(text: String, color: UIColor, font: UIFont) {
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: color,
            .font: font
        ]
        
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
