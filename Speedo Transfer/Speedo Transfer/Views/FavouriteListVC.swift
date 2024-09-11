//
//  FavouriteListVC.swift
//  Speedo Transfer
//
//  Created by 1234 on 12/09/2024.
//

import UIKit

class FavouriteListVC: UIViewController {
    @IBOutlet weak var TableViewFavList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            applyGradientBgYellowToRed()

        let backButton = UIBarButtonItem()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        TableViewFavList.separatorStyle = .none
        TableViewFavList.delegate = self
        TableViewFavList.dataSource = self
        
        let nib = UINib(nibName: "FavouriteListCell", bundle: nil)
        TableViewFavList.register(nib, forCellReuseIdentifier: "FavouriteListCell")
    }
}
extension FavouriteListVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteListCell" , for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
}
