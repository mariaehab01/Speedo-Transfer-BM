////
////  CustomTextField.swift
////  Speedo Transfer
////
////  Created by Maria Ehab on 10/09/2024.
////
//
//
//import UIKit
//
//enum CustomTextFieldType: String {
//    case name
//    case email
//    case password
//    case confirmPassword
//    case country
//    case dateOfBirth
//}
//
//// MARK: - Delegation Design Pattern
//protocol CustomTextFieldDelegate: AnyObject {
//    func didTapCountryPicker(textField: CustomTextField)
//    func didTapDatePicker(textField: CustomTextField)
//}
//
//@IBDesignable
//class CustomTextField: UITextField {
//
////    weak var customDelegate: CustomTextFieldDelegate?
////    
////    private var actionButton: UIButton!
////    private var type: CustomTextFieldType?
////    
////    override func layoutSubviews() {
////        super.layoutSubviews()
////        // Ensure any custom layout does not interfere with leftView or rightView
////    }
////
////    @IBInspectable var fieldType: String {
////        get {
////            return String(describing: self.type)
////        }
////        set {
////            if let customType = CustomTextFieldType(rawValue: newValue) {
////                setType(customType)
////            }
////        }
////    }
////
////    init(frame: CGRect, type: CustomTextFieldType) {
////        super.init(frame: frame)
////        self.type = type
////        setup()
////    }
////
////    required init?(coder: NSCoder) {
////        super.init(coder: coder)
////        setup()
////    }
////
////    private func setup() {
////        self.borderStyle = .roundedRect
////        self.backgroundColor = UIColor.white
////        self.layer.borderWidth = 1.5
////        self.layer.borderColor = Colors.textFieldBorderColor.cgColor
////        self.layer.cornerRadius = 6
////
////        actionButton = UIButton(type: .system)
////        actionButton.tintColor = Colors.textFieldBorderColor
////        actionButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
////        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
////
////        let paddingWidth = actionButton.frame.width + 16
////        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingWidth, height: 30))
////        paddingView.addSubview(actionButton)
////
////        self.rightView = paddingView
////        self.rightViewMode = .always
////    }
////
////    func setType(_ type: CustomTextFieldType) {
////        self.type = type
////        switch type {
////        case .name:
////            actionButton.setImage(UIImage(named: "profile"), for: .normal)
////            actionButton.accessibilityLabel = NSLocalizedString("Enter Name", comment: "")
////        case .email:
////            actionButton.setImage(UIImage(named: "email"), for: .normal)
////            actionButton.accessibilityLabel = NSLocalizedString("Enter Email", comment: "")
////        case .password, .confirmPassword:
////            self.isSecureTextEntry = true
////            actionButton.setImage(UIImage(named: "eye"), for: .normal)
////            actionButton.accessibilityLabel = NSLocalizedString("Toggle Password Visibility", comment: "")
////        case .country:
////            actionButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
////            actionButton.accessibilityLabel = NSLocalizedString("Select Country", comment: "")
////        case .dateOfBirth:
////            actionButton.setImage(UIImage(named: "calender"), for: .normal)
////            actionButton.accessibilityLabel = NSLocalizedString("Select Date of Birth", comment: "")
////        }
////    }
////
////    @objc private func buttonTapped() {
////        print("buttonTapped method called")
////        switch type {
////        case .name, .email:
////            break
////        case .password, .confirmPassword:
////            self.isSecureTextEntry.toggle()
////            let imageName = self.isSecureTextEntry ? "eye" : "Open-eye"
////            actionButton.setImage(UIImage(named: imageName), for: .normal)
////        case .country:
////            customDelegate?.didTapCountryPicker(textField: self)
////        case .dateOfBirth:
////            customDelegate?.didTapDatePicker(textField: self)
////            showDatePicker()
////        case .none:
////            break
////        }
////    }
////
////    private func showDatePicker() {
////        let datePicker = UIDatePicker()
////        datePicker.datePickerMode = .date
////        datePicker.preferredDatePickerStyle = .wheels
////        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
////
////        let toolbar = UIToolbar()
////        toolbar.sizeToFit()
////        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
////        toolbar.setItems([doneButton], animated: true)
////
////        self.inputAccessoryView = toolbar
////        self.inputView = datePicker
////        self.becomeFirstResponder()
////    }
////
////    @objc private func dateChanged(datePicker: UIDatePicker) {
////        let dateFormatter = DateFormatter()
////        dateFormatter.dateFormat = "dd/MM/yyyy"
////        self.text = dateFormatter.string(from: datePicker.date)
////    }
////
////    @objc private func donePressed() {
////        self.resignFirstResponder()
////    }
//}
