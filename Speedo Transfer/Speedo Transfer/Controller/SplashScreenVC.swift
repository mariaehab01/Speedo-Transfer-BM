//
//  SplashScreenVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 29/08/2024.
//

import UIKit

class SplashScreenVC: UIViewController {

    @IBOutlet weak var splashLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        signUpVC.modalPresentationStyle = .fullScreen
        
        UIView.animate(withDuration: 1.0, animations: {
            self.splashLabel.alpha = 0.0
        }, completion: { _ in
            self.present(signUpVC, animated: false, completion: nil)
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
