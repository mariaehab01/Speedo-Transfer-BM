//
//  TransfersAmountVC.swift
//  Speedo Transfer
//
//  Created by 1234 on 10/09/2024.
//

import UIKit

class TransfersAmountVC: UIViewController {
    
    @IBOutlet weak var amountLabelTop: UILabel!
    @IBOutlet weak var ConfirmationLabel: UILabel!
    @IBOutlet weak var HMLabel: UILabel!
    @IBOutlet weak var RILabel: UILabel!
    @IBOutlet weak var PaymentLabel: UILabel!
    @IBOutlet weak var RecipientAccountLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var RNameLabel: UILabel!
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var recipientNameTextField: UITextField!
    @IBOutlet weak var recipientAccountTextField: UITextField!
    
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        if isValidData() {
            let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
            let transfersAmount2VC = sb.instantiateViewController(withIdentifier: "TransfersAmount2VC") as! TransfersAmount2VC
            self.navigationController?.pushViewController(transfersAmount2VC, animated: true)
        }
    }
    
    private func isValidData() -> Bool {
        guard let amount = amountTextField.text?.trimmed, !amount.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter an amount!")
            return false
        }
        
        guard let recipientName = recipientNameTextField.text?.trimmed, !recipientName.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter a recipient name!")
            return false
        }
        
        guard let recipientAccount = recipientAccountTextField.text?.trimmed, !recipientAccount.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter a recipient account!")
            return false
        }
        return true
    }
    
    @IBAction func FavouriteBtnTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        
        guard let destinationController = storyboard.instantiateViewController(withIdentifier: "FavouritesListVC") as? FavouritesListVC else { return }

        if let presentationController = destinationController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large() ]
            presentationController.preferredCornerRadius = 50
            presentationController.prefersGrabberVisible = true
        }
        self.present(destinationController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        amountLabel.font = UIFont(name: Fonts.regularInter , size: 16)
        amountLabelTop.font = UIFont(name: Fonts.regularInter , size: 14)
        ConfirmationLabel.font = UIFont(name: Fonts.regularInter , size: 14)
        PaymentLabel.font = UIFont(name: Fonts.regularInter , size: 14)
        HMLabel.font = UIFont(name: Fonts.regularInter , size: 20)
        RILabel.font = UIFont(name: Fonts.regularInter , size: 16)
        RecipientAccountLabel.font = UIFont(name: Fonts.regularInter , size: 16)
        RNameLabel.font = UIFont(name: Fonts.regularInter , size: 16)
        
       applyGradientBgYellowToRed()
        
    }

}



