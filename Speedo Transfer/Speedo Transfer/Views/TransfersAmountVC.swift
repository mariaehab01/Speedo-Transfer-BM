//
//  TransfersAmountVC.swift
//  Speedo Transfer
//
//  Created by 1234 on 10/09/2024.
//

import UIKit

class TransfersAmountVC: UIViewController {
    
    @IBAction func FavouriteBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let destinationController = storyboard.instantiateViewController(withIdentifier: "FavouritesVC") as? FavouritesVC else { return }

        if let presentationController = destinationController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large() ]
            presentationController.preferredCornerRadius = 50
            presentationController.prefersGrabberVisible = true
        }
        self.present(destinationController, animated: true)
        
    }
    
    @IBAction func ContinueBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var amountLabelTop: UILabel!
    @IBOutlet weak var ConfirmationLabel: UILabel!
    @IBOutlet weak var HMLabel: UILabel!
    @IBOutlet weak var RILabel: UILabel!
    @IBOutlet weak var PaymentLabel: UILabel!
    @IBOutlet weak var RecipientAccountLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var RNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        amountLabel.font = UIFont(name: Fonts.inter , size: 16)
        amountLabelTop.font = UIFont(name: Fonts.inter , size: 14)
        ConfirmationLabel.font = UIFont(name: Fonts.inter , size: 14)
        PaymentLabel.font = UIFont(name: Fonts.inter , size: 14)
        HMLabel.font = UIFont(name: Fonts.inter , size: 20)
        RILabel.font = UIFont(name: Fonts.inter , size: 16)
        RecipientAccountLabel.font = UIFont(name: Fonts.inter , size: 16)
        RNameLabel.font = UIFont(name: Fonts.inter , size: 16)
        
       applyGradientBgYellowToRed()
        
    }

}



