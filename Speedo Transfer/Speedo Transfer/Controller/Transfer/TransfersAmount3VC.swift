//
//  TransfersAmount3VC.swift
//  Speedo Transfer
//
//  Created by 1234 on 11/09/2024.
//

import UIKit

class TransfersAmount3VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        applyGradientBgYellowToRed()

        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = UIColor.black
    
    }
    

    
    @IBAction func backToHomeBtnTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        let tabBarVC = sb.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let window = appDelegate.window {
            window.rootViewController = tabBarVC
            
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    
    @IBAction func addToFavBtnTapped(_ sender: UIButton) {
        showAlert(title: "Done", message: "Transfer added to favourites!")
    }
    


}
