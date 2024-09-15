//
//  EditVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 12/09/2024.
//

import UIKit

class EditVC: UIViewController {

    @IBOutlet weak var accountTextField: CustomTextField!
    @IBOutlet weak var nameTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        if validateTextFields() {
            let alert = UIAlertController(title: "Done", message: "Favourite list updated successfully!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
                self.navigationController?.popViewController(animated: true)

            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func validateTextFields() -> Bool {
        guard let accountText = accountTextField.text?.trimmed, !accountText.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your account.")
            return false
        }
        
        guard let nameText = nameTextField.text?.trimmed, !nameText.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your name.")
            return false
        }
        
        return true
    }

}
