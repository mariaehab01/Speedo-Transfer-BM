//
//  FavouriteEditCell.swift
//  Speedo Transfer
//
//  Created by Maria Ehab
//

import UIKit
import FittedSheets

// MARK: - FavouriteEditCellDelegate
// Delegate protocol for handling actions in the FavouriteEditCell
protocol FavouriteEditCellDelegate: AnyObject {
    func didTapEdit(in cell: FavouriteEditCell)
    func didTapDelete(in cell: FavouriteEditCell)
}

// MARK: - FavouriteEditCell

class FavouriteEditCell: UITableViewCell {

    // MARK: - Properties

    weak var delegate: FavouriteEditCellDelegate?
        
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Actions

    @IBAction func editButtonTapped(_ sender: Any) {
        delegate?.didTapEdit(in: self)

    }
    
    @IBAction func deleteBtnTapped(_ sender: Any) {
        delegate?.didTapDelete(in: self)
    }
}
