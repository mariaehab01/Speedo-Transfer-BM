//
//  LastTransactionsVC.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 12/09/2024.
//

import UIKit

class LastTransactionsVC: UIViewController {

    @IBOutlet weak var lastTransactionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applyGradientBgYellowToRed()
        setupNavBar()
        lastTransactionsTableView.separatorStyle = .none
        lastTransactionsTableView.delegate = self
        lastTransactionsTableView.dataSource =  self
        let nib = UINib(nibName: "LastTransactionsCell", bundle: nil)
        lastTransactionsTableView.register(nib, forCellReuseIdentifier: "LastTransactionsCell")
        
    }
    
    private func setupNavBar() {

        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = Colors.backBtnColor
        let titleLabel = UILabel()
        titleLabel.text = "Transactions"
        titleLabel.font = UIFont(name: Fonts.mediumInter, size: 20)
        titleLabel.textColor = Colors.blackGrayColor
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
    }

}

extension LastTransactionsVC:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LastTransactionsCell", for: indexPath)
    cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "TransactionsDetails") as! TransactionsDetails
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
}
