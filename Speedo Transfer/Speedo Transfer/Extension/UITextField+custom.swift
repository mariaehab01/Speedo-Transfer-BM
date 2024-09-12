//
//  UITextField+icon.swift
//  Speedo Transfer
//
//  Created by Maria Ehab 
//

import Foundation
import UIKit

extension UITextField {
    
    func addLeftIcon(image: UIImage, padding: CGFloat = 8.0) {
        let iconView = UIImageView(image: image)
        iconView.contentMode = .scaleAspectFit
        let iconSize: CGFloat = 24
        let width = iconSize + padding
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: iconSize))
        
        iconView.frame = CGRect(x: padding / 2, y: 0, width: iconSize, height: iconSize)
        containerView.addSubview(iconView)
        
        self.leftView = containerView
        self.leftViewMode = .always
    }

    func addRightIcon(image: UIImage, padding: CGFloat = 8.0) {
        let iconView = UIImageView(image: image)
        iconView.contentMode = .scaleAspectFit
        let iconSize: CGFloat = 24
        let width = iconSize + padding
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: iconSize))
        
        iconView.frame = CGRect(x: padding / 2, y: 0, width: iconSize, height: iconSize)
        containerView.addSubview(iconView)
        
        self.rightView = containerView
        self.rightViewMode = .always
    }
    
    func setBorder(color: UIColor, width: CGFloat = 1.0) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = 6.0 
    }

    private func showDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)

        self.inputAccessoryView = toolbar
        self.inputView = datePicker
        self.becomeFirstResponder()
    }
    
    @objc private func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc private func donePressed() {
        self.resignFirstResponder()
    }

}

