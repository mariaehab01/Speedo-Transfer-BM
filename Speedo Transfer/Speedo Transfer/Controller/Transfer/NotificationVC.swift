//
//  NotificationVC.swift
//  Speedo Transfer
//
//  Created by 1234 on 15/09/2024.
//

import UIKit

class NotificationVC: UIViewController {
    @IBOutlet weak var NotificationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationTableView.separatorStyle = .none
        NotificationTableView.delegate = self
        NotificationTableView.dataSource = self
        
        let nib = UINib(nibName: "NotificationTableViewCell", bundle: nil)
        NotificationTableView.register(nib, forCellReuseIdentifier: "NotificationTableViewCell")
        
        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        
        applyGradientBgYellowToRed()

    }

}

extension NotificationVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell" , for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "TransactionsDetails") as! TransactionsDetails
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    
}

    
 
