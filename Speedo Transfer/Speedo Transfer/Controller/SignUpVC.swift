//
//  SignUpVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 29/08/2024.
//

import UIKit

class SignUpVC: UIViewController {

    let gradientLayer = CAGradientLayer()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        setupGradientLayer()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        gradientLayer.frame = view.bounds
        
    }
    
    func setupGradientLayer() {
        gradientLayer.colors = [
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor,
            UIColor(red: 1.0, green: 0.917, blue: 0.933, alpha: 1.0).cgColor
        ]
        
        
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        
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
