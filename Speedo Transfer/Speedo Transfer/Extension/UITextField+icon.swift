//
//  UITextField+icon.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 09/09/2024.
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
            
            // Set the frame directly for the icon
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
            
            // Set the frame directly for the icon
            iconView.frame = CGRect(x: padding / 2, y: 0, width: iconSize, height: iconSize)
            containerView.addSubview(iconView)
            
            self.rightView = containerView
            self.rightViewMode = .always
        }
    
    func setBorder(color: UIColor, width: CGFloat = 1.0) {
            self.layer.borderColor = color.cgColor
            self.layer.borderWidth = width
            self.layer.cornerRadius = 6.0 // Optional: Add corner radius if needed
        }

}

//extension UITextField {
//
//    enum FieldType {
//        case password, country, dateOfBirth, name, email, none
//    }
//
//    func configureField(with type: FieldType, leftIcon: UIImage? = nil, rightIcon: UIImage? = nil) {
//        if let leftIcon = leftIcon {
//            addLeftIcon(image: leftIcon)
//        }
//        
//        if let rightIcon = rightIcon {
//            addRightIcon(image: rightIcon)
//        }
//        
//        switch type {
//        case .password:
//            configurePasswordField()
//        case .country:
//            configureCountryField()
//        case .dateOfBirth:
//            configureDateOfBirthField()
//        case .name, .email, .none:
//            break
//        }
//    }
//
//    private func configurePasswordField() {
//        let actionButton = UIButton(type: .custom)
//        actionButton.setImage(UIImage(named: "eyeImage"), for: .normal)
//        actionButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
//        
//        self.rightView = actionButton
//        self.rightViewMode = .always
//    }
//
//    private func configureCountryField() {
//        let actionButton = UIButton(type: .custom)
//        actionButton.setTitle("▼", for: .normal)
//        actionButton.setTitleColor(.gray, for: .normal)
//        actionButton.addTarget(self, action: #selector(countryButtonTapped), for: .touchUpInside)
//        
//        self.rightView = actionButton
//        self.rightViewMode = .always
//    }
//
//    private func configureDateOfBirthField() {
//        let actionButton = UIButton(type: .custom)
//        actionButton.setTitle("▼", for: .normal)
//        actionButton.setTitleColor(.gray, for: .normal)
//        actionButton.addTarget(self, action: #selector(showDatePicker), for: .touchUpInside)
//        
//        self.rightView = actionButton
//        self.rightViewMode = .always
//    }
//
//    func addLeftIcon(image: UIImage, padding: CGFloat = 8.0) {
//        let iconView = UIImageView(image: image)
//        iconView.contentMode = .scaleAspectFit
//        let iconSize: CGFloat = 24
//        let width = iconSize + padding
//        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: iconSize))
//
//        iconView.frame = CGRect(x: padding / 2, y: 0, width: iconSize, height: iconSize)
//        containerView.addSubview(iconView)
//
//        self.leftView = containerView
//        self.leftViewMode = .always
//    }
//
//    func addRightIcon(image: UIImage, padding: CGFloat = 8.0) {
//        let iconView = UIImageView(image: image)
//        iconView.contentMode = .scaleAspectFit
//        let iconSize: CGFloat = 24
//        let width = iconSize + padding
//        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: iconSize))
//
//        iconView.frame = CGRect(x: padding / 2, y: 0, width: iconSize, height: iconSize)
//        containerView.addSubview(iconView)
//
//        self.rightView = containerView
//        self.rightViewMode = .always
//    }
//    
//    func setBorder(color: UIColor, width: CGFloat = 1.0) {
//        self.layer.borderColor = color.cgColor
//        self.layer.borderWidth = width
//        self.layer.cornerRadius = 6.0 // Optional: Add corner radius if needed
//    }
//    
//
//    @objc private func togglePasswordVisibility() {
//        self.isSecureTextEntry.toggle()
//        let imageName = self.isSecureTextEntry ? "eyeImage" : "Open-eye"
//        if let actionButton = self.rightView as? UIButton {
//            actionButton.setImage(UIImage(named: imageName), for: .normal)
//        }
//    }
//
//    @objc private func countryButtonTapped() {
//        self.sendActions(for: .editingDidBegin)
//    }
//
//    @objc private func showDatePicker() {
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .date
//        datePicker.preferredDatePickerStyle = .wheels
//        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
//
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
//        toolbar.setItems([doneButton], animated: true)
//
//        self.inputAccessoryView = toolbar
//        self.inputView = datePicker
//        self.becomeFirstResponder()
//    }
//
//    @objc private func dateChanged(datePicker: UIDatePicker) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//        self.text = dateFormatter.string(from: datePicker.date)
//    }
//
//    @objc private func donePressed() {
//        self.resignFirstResponder()
//    }
//}
