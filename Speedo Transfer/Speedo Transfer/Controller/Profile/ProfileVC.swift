//
//  ProfileVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab 
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        applyGradientBgYellowToRed()  
        nameLabel.font = UIFont(name: Fonts.semiBoldInter, size: 20)
    }
    

    private func setupNavBar() {

        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = Colors.backBtnColor
        let titleLabel = UILabel()
        titleLabel.text = "Profile"
        titleLabel.font = UIFont(name: Fonts.mediumInter, size: 20)
        titleLabel.textColor = Colors.blackGrayColor
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
    }

}
