//
//  FavouritesVC.swift
//  Speedo Transfer
//
//  Created by 1234 on 11/09/2024.
//

import UIKit

class FavouritesListVC: UIViewController {
    @IBOutlet weak var favTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favTableView.separatorStyle = .none
        favTableView.delegate = self
        favTableView.dataSource = self
        
        let nib = UINib(nibName: "FavouritesListCell", bundle: nil)
        favTableView.register(nib, forCellReuseIdentifier: "FavouritesListCell")
    }
}
extension FavouritesListVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesListCell" , for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
