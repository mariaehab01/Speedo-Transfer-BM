//
//  NotificationDetailsVC.swift
//  Speedo Transfer
//
//  Created by 1234 
//

import UIKit

class NotificationDetailsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = UIColor.black    }
    
}
