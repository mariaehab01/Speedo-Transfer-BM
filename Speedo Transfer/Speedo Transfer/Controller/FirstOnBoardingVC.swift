//
//  FirstOnBoardingVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 08/09/2024.
//

import UIKit

class FirstOnBoardingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        applyGradientBgWhiteToRed()
    }
    
    
    @IBAction func skipBtnTapped(_ sender: UIButton) {
        OnboardingHelper.skipToSignUp(from: self)
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        OnboardingHelper.moveToNextOnboardingScreen(currentVC: self, nextVCIdentifier: VCS.secondOnboardingScreen)

    }

}
