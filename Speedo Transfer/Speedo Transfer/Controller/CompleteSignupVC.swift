//
//  CompleteSignupVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 10/09/2024.
//

import UIKit

class CompleteSignupVC: UIViewController {
    
    var user: User?

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyGradientBgWhiteToRed()
        signInButton.setUnderlinedTitle(
            text: "Sign In",
            color: UIColor(red: 0.529, green: 0.118, blue: 0.208, alpha: 1),
            font: UIFont(name: Fonts.regularInter, size: 16)!
        )

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueBtnTapped(_ sender: Any) {
    }
    

    @IBAction func signInBtnTapped(_ sender: Any) {
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
