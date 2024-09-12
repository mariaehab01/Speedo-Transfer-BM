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
        
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        
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
        sheetController.gripColor = UIColor(named: "LabelColor")
        self.present(sheetController, animated: true, completion: nil)
    }
    
    func didSelectCountry(country: Country) {
        countryTextField.text = country.label
    }
    
}
