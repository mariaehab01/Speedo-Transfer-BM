//
//  SplashScreenVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 29/08/2024.
//

import UIKit

// MARK: - Splash Screen

class SplashScreenVC: UIViewController {

    @IBOutlet weak var splashLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.primaryColor
        splashLabel.font = UIFont(name: Fonts.regularInter, size: 32)
        
        animateLabel()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.decideNextScreen()
        }
    }
    
    func animateLabel() {
        splashLabel.alpha = 0.0
        
        UIView.animate(withDuration: 1.0, animations: {
            self.splashLabel.alpha = 1.0
        })
    }

    func decideNextScreen() {
        if let hasSeenOnboarding = UserDefaultsManager.shared().hasSeenOnboarding, hasSeenOnboarding {
            self.moveToRegistrationScreen()
        } else {
            self.moveToOnboardingScreen()
        }
    }

    func moveToOnboardingScreen() {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        let firstOnboardingVC = sb.instantiateViewController(withIdentifier: VCS.firstOnboardingScreen) as! FirstOnBoardingVC
        
        UIView.animate(withDuration: 1.0, animations: {
            self.splashLabel.alpha = 0.0
        }, completion: { _ in
            self.navigationController?.pushViewController(firstOnboardingVC, animated: true)
        })
    }
        
    func moveToRegistrationScreen() {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        let registrationVC = sb.instantiateViewController(withIdentifier: VCS.signUpVC) as! SignUpVC
        
        UIView.animate(withDuration: 1.0, animations: {
            self.splashLabel.alpha = 0.0
        }, completion: { _ in
            self.navigationController?.pushViewController(registrationVC, animated: true)
        })
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
