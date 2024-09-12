//
//  CompleteSignupVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 10/09/2024.
//

import UIKit
import FittedSheets

class CompleteSignupVC: UIViewController, CountrySelectionDelegate{
    
    var user: User!

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var countryTextField: CustomTextField!
    @IBOutlet weak var dobTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyGradientBgWhiteToRed()
        
        signInButton.setUnderlinedTitle(
            text: "Sign In",
            color: UIColor(hex: "#871E35"),
            font: UIFont(name: Fonts.regularInter, size: 16)!
        )
        
        countryTextField.isUserInteractionEnabled = true
        dobTextField.isUserInteractionEnabled = true

        
        configureTextFields()
        
    }
    
    func configureTextFields() {
        countryTextField.setType(.country)
        
        countryTextField.addTarget(self, action: #selector(showCountryPicker), for: .editingDidBegin)
        
        dobTextField.setType(.dateOfBirth)
        
    }
    
    @IBAction func continueBtnTapped(_ sender: Any) {
        guard let user = user else {
            return
        }
        
        let name = user.name
        let email = user.email
        let password = user.password
        let country = countryTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let dateOfBirth = dobTextField.text ?? ""
        
        self.goToSignInScreen()

    }
    

    @IBAction func signInBtnTapped(_ sender: Any) {
        goToSignInScreen()
    }
    
    private func goToSignInScreen() {
        let signInVC = self.storyboard?.instantiateViewController(withIdentifier: VCS.signInVC) as! SignInVC
        self.navigationController?.pushViewController(signInVC, animated: true)
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


