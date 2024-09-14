//
//  TransfersAmount2VC.swift
//  Speedo Transfer
//
//  Created by 1234
//

import UIKit

class TransfersAmount2VC: UIViewController {
    
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
    
    
    @IBAction func previousBtnTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        let transfersAmountVC = sb.instantiateViewController(withIdentifier: VCS.transfersAmountVC) as! TransfersAmountVC
        self.navigationController?.pushViewController(transfersAmountVC, animated: true)
    }
}
