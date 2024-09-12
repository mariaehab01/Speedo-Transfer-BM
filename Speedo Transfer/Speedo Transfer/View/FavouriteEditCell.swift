//
//  FavouriteEditCell.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 12/09/2024.
//

import UIKit
import FittedSheets

protocol FavouriteEditCellDelegate: AnyObject {
    func didTapIcon(in cell: FavouriteEditCell)
}

class FavouriteEditCell: UITableViewCell {

    // Delegate property
    weak var delegate: FavouriteEditCellDelegate?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        delegate?.didTapIcon(in: self)

    }
    
    
}
