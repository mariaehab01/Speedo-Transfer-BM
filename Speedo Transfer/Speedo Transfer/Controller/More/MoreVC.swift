//
//  MoreVC.swift
//  Speedo Transfer
//
//

import UIKit

class MoreVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applyGradientBgYellowToRed()

    }
    
    @IBAction func logoutBtnTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
        
        loginVC.hidesBottomBarWhenPushed = true
        
        if let navigationController = self.navigationController {
            navigationController.setViewControllers([loginVC], animated: true)
        }
    }

}
