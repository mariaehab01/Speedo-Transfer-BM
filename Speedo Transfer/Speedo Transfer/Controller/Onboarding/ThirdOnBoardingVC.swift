//
//  ThirdOnBoardingVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 08/09/2024.
//

import UIKit

class ThirdOnBoardingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        applyGradientBgWhiteToRed()
    }
    
    @IBAction func skipBtnTapped(_ sender: Any) {
        OnboardingHelper.skipToSignUp(from: self)
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        OnboardingHelper.skipToSignUp(from: self)
    }
}

