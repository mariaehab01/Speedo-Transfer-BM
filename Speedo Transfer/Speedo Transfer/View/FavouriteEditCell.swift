//
//  FavouriteEditCell.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 12/09/2024.
//

import UIKit
import FittedSheets

protocol FavouriteEditCellDelegate: AnyObject {
    func didTapEdit(in cell: FavouriteEditCell)
    func didTapDelete(in cell: FavouriteEditCell)
}

class FavouriteEditCell: UITableViewCell {

    // Delegate property
    weak var delegate: FavouriteEditCellDelegate?
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        delegate?.didTapEdit(in: self)

    }
    
    @IBAction func deleteBtnTapped(_ sender: Any) {
        delegate?.didTapDelete(in: self)
    }
}
