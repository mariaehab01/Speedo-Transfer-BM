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
    let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
    
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
            if let isLoggedIn = UserDefaultsManager.shared().isLoggedIn {
                if isLoggedIn {
                    self.moveToHomeScreen()
                } else {
                    self.moveToLoginScreen()
                }
            } else {
                self.moveToRegistrationScreen()
            }
            
        } else {
            self.moveToOnboardingScreen()
        }
    }

    private func moveToOnboardingScreen() {
        let onboardingVC = OnboardingVC(nibName: "OnboardingVC", bundle: nil)
        //        let firstOnboardingVC = sb.instantiateViewController(withIdentifier: VCS.firstOnboardingScreen) as! FirstOnBoardingVC
        UIView.animate(withDuration: 1.0, animations: {
            self.splashLabel.alpha = 0.0
        }, completion: { _ in
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = .fade
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(onboardingVC, animated: false)
        })
    }
        
    private func moveToRegistrationScreen() {
        let registrationVC = sb.instantiateViewController(withIdentifier: VCS.signUpVC) as! SignUpVC
        UIView.animate(withDuration: 1.0, animations: {
            self.splashLabel.alpha = 0.0
        }, completion: { _ in
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = .fade
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(registrationVC, animated: false)
        })
    }
    
    private func moveToHomeScreen(){
        let homeVC = sb.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
        
        UIView.animate(withDuration: 1.0, animations: {
            self.splashLabel.alpha = 0.0
        }, completion: { _ in
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = .fade
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(homeVC, animated: false)
        })
    }
    
    private func moveToLoginScreen(){
        let signInVC = sb.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
        
        UIView.animate(withDuration: 1.0, animations: {
            self.splashLabel.alpha = 0.0
        }, completion: { _ in
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = .fade
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(signInVC, animated: false)
        })
    }

}
