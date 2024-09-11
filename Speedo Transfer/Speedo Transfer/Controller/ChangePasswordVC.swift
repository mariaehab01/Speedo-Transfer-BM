//
//  ChangePasswordVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 11/09/2024.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var currentPassTextField: UITextField!
    @IBOutlet weak var newPassTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTextFields()
        setupNavBar()
        applyGradientBgYellowToRed()
    }
    

    func configureTextFields() {

        currentPassTextField.addRightIcon(image: UIImage(named: "eyeImage")!, padding: 16.0)
        currentPassTextField.setBorder(color: Colors.textFieldBorderColor)
        newPassTextField.addRightIcon(image: UIImage(named: "eyeImage")!, padding: 16.0)
        newPassTextField.setBorder(color: Colors.textFieldBorderColor)
        
    }
    
    private func setupNavBar() {

        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = Colors.backBtnColor
        let titleLabel = UILabel()
        titleLabel.text = "Change Password"
        titleLabel.font = UIFont(name: Fonts.mediumInter, size: 20)
        titleLabel.textColor = Colors.blackGrayColor
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
//        navigationItem.leftItemsSupplementBackButton = false
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }

}
