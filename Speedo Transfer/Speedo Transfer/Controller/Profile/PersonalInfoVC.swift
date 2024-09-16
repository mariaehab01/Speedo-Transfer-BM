//
//  PersonalInfoVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab 
//

import UIKit

class PersonalInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        applyGradientBgYellowToRed()
        self.tabBarController?.tabBar.isHidden = false

    }
    

    private func setupNavBar() {

        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = Colors.backBtnColor
        let titleLabel = UILabel()
        titleLabel.text = "Profile information"
        titleLabel.font = UIFont(name: Fonts.mediumInter, size: 20)
        titleLabel.textColor = Colors.blackGrayColor
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
    }

}
