//
//  TransfersAmount3VC.swift
//  Speedo Transfer
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
