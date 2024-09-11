//
//  OnboardingHelper.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 08/09/2024.
//

import UIKit

class OnboardingHelper {
    
    // MARK: - Navigation
    
    static func skipToSignUp(from viewController: UIViewController) {
        
        UserDefaultsManager.shared().hasSeenOnboarding = true
        let signUpVC = viewController.storyboard?.instantiateViewController(withIdentifier: VCS.signUpVC) as! SignUpVC
        viewController.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    static func moveToNextOnboardingScreen(currentVC: UIViewController, nextVCIdentifier: String) {
        let nextVC = currentVC.storyboard?.instantiateViewController(withIdentifier: nextVCIdentifier)
        currentVC.navigationController?.pushViewController(nextVC!, animated: false)
    }
}

