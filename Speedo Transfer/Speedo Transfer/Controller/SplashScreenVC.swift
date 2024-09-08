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
        splashLabel.font = UIFont(name: Fonts.inter, size: 32)
        
        animateLabel()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.moveToNextScreen()
        }
    }
    
    func animateLabel() {
        splashLabel.alpha = 0.0
        
        UIView.animate(withDuration: 1.0, animations: {
            self.splashLabel.alpha = 1.0
        })
    }

    func moveToNextScreen() {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        let signUpVC = sb.instantiateViewController(withIdentifier: VCS.signUpVC) as! SignUpVC
        let navVC = UINavigationController(rootViewController: signUpVC)
        
        navVC.modalPresentationStyle = .fullScreen

        UIView.animate(withDuration: 1.0, animations: {
            self.splashLabel.alpha = 0.0
        }, completion: { _ in
            self.present(navVC, animated: false, completion: nil)
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
