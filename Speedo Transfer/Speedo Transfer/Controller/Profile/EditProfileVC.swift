//
//  EditProfileVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 12/09/2024.
//

import UIKit
import FittedSheets

class EditProfileVC: UIViewController, CountrySelectionDelegate {

    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var countryTextField: CustomTextField!
    @IBOutlet weak var dobTextField: CustomTextField!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.font = UIFont(name: Fonts.regularInter, size: 16)
        nameLabel.textColor = UIColor(hex: "#3C3A37")
        emailLabel.font = UIFont(name: Fonts.regularInter, size: 16)
        emailLabel.textColor = UIColor(hex: "#3C3A37")
        countryLabel.font = UIFont(name: Fonts.regularInter, size: 16)
        countryLabel.textColor = UIColor(hex: "#3C3A37")
        dobLabel.font = UIFont(name: Fonts.regularInter, size: 16)
        dobLabel.textColor = UIColor(hex: "#3C3A37")
        
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter Cardholder Name",
            attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor]
        )
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter Cardholder Name",
            attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor]
        )
        countryTextField.attributedPlaceholder = NSAttributedString(
            string: "Egypt",
            attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor]
        )
        dobTextField.attributedPlaceholder = NSAttributedString(
            string: "12/02/2000",
            attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor]
        )
        
        configureTextFields()
        applyGradientBgYellowToRed()
        setupNavBar()
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        if isValidData() {
            updateUserInUserDefaults()
            
            let alert = UIAlertController(title: "Done", message: "Profile updated successfully!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func isValidData() -> Bool {
        guard let name = nameTextField.text?.trimmed, !name.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your name!")
            return false
        }
        
        guard let email = emailTextField.text?.trimmed, !email.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your email!")
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.com"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        guard let email = emailTextField.text?.trimmed, !email.isEmpty, emailPredicate.evaluate(with: email) else {
            showAlert(title: "Sorry", message: "Please enter a valid email address!")
            return false
        }
        
        guard let country = countryTextField.text, !country.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your country!")
            return false
        }
        guard let dob = dobTextField.text, !dob.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your date of birth!")
            return false
        }
        
        return true
    }
    
    private func updateUserInUserDefaults() {
        guard let savedUserData = UserDefaults.standard.data(forKey: "user"),
              var savedUser = try? JSONDecoder().decode(User.self, from: savedUserData) else {
            return
        }
        
        if let name = nameTextField.text?.trimmed {
            savedUser.name = name
        }
        if let email = emailTextField.text?.trimmed {
            savedUser.email = email
        }
        
        if let updatedUserData = try? JSONEncoder().encode(savedUser) {
            UserDefaults.standard.set(updatedUserData, forKey: "user")
        }
    }
    
    func configureTextFields() {

        countryTextField.setType(.country)
        countryTextField.addTarget(self, action: #selector(showCountryPicker), for: .editingDidBegin)
        dobTextField.setType(.dateOfBirth)
        
    }
    
    private func setupNavBar() {

        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = Colors.backBtnColor
        let titleLabel = UILabel()
        titleLabel.text = "Edit Profile"
        titleLabel.font = UIFont(name: Fonts.mediumInter, size: 20)
        titleLabel.textColor = Colors.blackGrayColor
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
    
    @objc func showCountryPicker() {
        guard let countrylist = storyboard?.instantiateViewController(withIdentifier: "CountryListVC") as? CountryListVC else {
            return
        }
        
        countrylist.delegate = self
        
        let sheetController = SheetViewController(controller: countrylist, sizes: [.fixed(500), .percent(0.5), .intrinsic])
        sheetController.cornerRadius = 50
        sheetController.gripColor = UIColor(hex: "#B0AFAE")
        self.present(sheetController, animated: true, completion: nil)
    }
    
    func didSelectCountry(country: Country) {
        countryTextField.text = country.label
    }
    
}
