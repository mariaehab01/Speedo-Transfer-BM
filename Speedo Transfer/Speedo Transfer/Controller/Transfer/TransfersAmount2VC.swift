//
//  TransfersAmount2VC.swift
//  Speedo Transfer
//
//  Created by 1234 on 10/09/2024.
//

import UIKit

class TransfersAmount2VC:
    
    UIViewController {
    @IBAction func continueBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var amountLabelTop: UILabel!
    @IBOutlet weak var confirmationLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applyGradientBgYellowToRed()

        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
}
