//
//  SettingVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 11/09/2024.
//

import UIKit

class SettingVC: UIViewController {

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
        titleLabel.text = "Setting"
        titleLabel.font = UIFont(name: Fonts.mediumInter, size: 20)
        titleLabel.textColor = Colors.blackGrayColor
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
    }
}
