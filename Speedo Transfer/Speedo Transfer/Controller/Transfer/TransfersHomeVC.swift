//
//  TransfersHomeVC.swift
//  Speedo Transfer
//
//  Created by 1234 
//

import UIKit

class TransfersHomeVC: UIViewController {
    
    @IBOutlet weak var BalanceLabel: UILabel!
    @IBOutlet weak var HomeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeTableView.separatorStyle = .none
        HomeTableView.delegate = self
        HomeTableView.dataSource = self
        
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        HomeTableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        
        self.navigationItem.hidesBackButton = true
        applyGradientBgYellowToRed()
        UserDefaultsManager.shared().isLoggedIn = true
        
    }
    
    @IBAction func viewAllBtnTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func notifictationBtnTapped(_ sender: UIButton) {
    }
}
extension TransfersHomeVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell" , for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
}
