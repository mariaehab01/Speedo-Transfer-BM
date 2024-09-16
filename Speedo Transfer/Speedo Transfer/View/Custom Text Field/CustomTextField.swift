//
//  Speedo Transfer
//

import UIKit

enum CustomTextFieldType {
    case name
    case email
    case password
    case country
    case dateOfBirth
}

class CustomTextField: UITextField {

    private var actionButton: UIButton!
    private var type: CustomTextFieldType?

    init(frame: CGRect, type: CustomTextFieldType) {
        super.init(frame: frame)
        self.type = type
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.borderStyle = .roundedRect
        self.backgroundColor = UIColor.white
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 6

        actionButton = UIButton(type: .system)
        actionButton.tintColor = UIColor.lightGray
        actionButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        paddingView.addSubview(actionButton)

        self.rightView = paddingView
        self.rightViewMode = .always
    }

    func setType(_ type: CustomTextFieldType) {
        self.type = type
        switch type {
        case .password:
            self.isSecureTextEntry = true
            actionButton.setImage(UIImage(named: "eyeImage"), for: .normal)
        case .country:
            actionButton.setImage(UIImage(named: "down-arrow"), for: .normal)
        case .dateOfBirth:
            actionButton.setImage(UIImage(named: "dateImage"), for: .normal)
        case .name:
            actionButton.setImage(UIImage(named: "personImage"), for: .normal)
        case .email:
            actionButton.setImage(UIImage(named: "emailImage"), for: .normal)
        }
    }

    // Handle button tap actions based on the type
    @objc private func buttonTapped() {
        switch type {
        case .password:
            self.isSecureTextEntry.toggle()
            let imageName = self.isSecureTextEntry ? "eyeImage" : "Open-eye"
            actionButton.setImage(UIImage(named: imageName), for: .normal)
        case .country:
            sendActions(for: .editingDidBegin)
        case .dateOfBirth:
            showDatePicker()
        case .name, .email:
            break
        case .none:
            break
        }
    }

    // Show the date picker for date of birth fields
    private func showDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(handleDateChanged(_:)), for: .valueChanged)

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        toolbar.setItems([doneButton], animated: true)

        self.inputAccessoryView = toolbar
        self.inputView = datePicker
        self.becomeFirstResponder()
    }

    // Handle date changes in the date picker
    @objc private func handleDateChanged(_ datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.text = dateFormatter.string(from: datePicker.date)
    }

    // Dismiss the picker when the done button is tapped
    @objc private func doneTapped() {
        self.resignFirstResponder()
    }
}
