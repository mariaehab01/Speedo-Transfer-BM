//
//  SignUpVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 29/08/2024.
//

import UIKit

class SignUpVC: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        applyGradientBackground()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        updateGradientFrame()
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
