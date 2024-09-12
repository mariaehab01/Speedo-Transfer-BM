//
//  FavouriteListVC.swift
//  Speedo Transfer
//
//  Created by 1234 on 12/09/2024.
//

import UIKit
import FittedSheets

class FavouriteEditVC: UIViewController {
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
        
        let nib = UINib(nibName: "FavouriteEditCell", bundle: nil)
        TableViewFavList.register(nib, forCellReuseIdentifier: "FavouriteEditCell")
    }
}

extension FavouriteEditVC : UITableViewDelegate, UITableViewDataSource, FavouriteEditCellDelegate {
    
    func didTapIcon(in cell: FavouriteEditCell) {
           
        let storyboard = UIStoryboard(name: Storyboards.main , bundle: nil)
        
           guard let editVC = storyboard.instantiateViewController(withIdentifier: "EditVC") as? EditVC else {
               return
           }
                      
           let sheetController = SheetViewController(controller: editVC, sizes: [.fixed(500), .percent(0.5), .intrinsic])
           sheetController.cornerRadius = 50
           sheetController.gripColor = UIColor(named: "LabelColor")
           self.present(sheetController, animated: true, completion: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteEditCell", for: indexPath) as! FavouriteEditCell
            cell.delegate = self
            return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
}
