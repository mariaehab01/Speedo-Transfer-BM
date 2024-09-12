//
//  FavouritesVC.swift
//  Speedo Transfer
//
//  Created by 1234 on 11/09/2024.
//

import UIKit

class FavouritesVC: UIViewController {
    @IBOutlet weak var FavTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FavTableView.separatorStyle = .none
        FavTableView.delegate = self
        FavTableView.dataSource = self
        
        let nib = UINib(nibName: "favoritsTableViewCell", bundle: nil)
        FavTableView.register(nib, forCellReuseIdentifier: "favoritsTableViewCell")
    }
}
extension FavouritesVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritsTableViewCell" , for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
