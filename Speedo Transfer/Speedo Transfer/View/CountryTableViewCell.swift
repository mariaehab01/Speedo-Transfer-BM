//
//  CountryTableViewCell.swift
//  Speedo Transfer
//
//  Created by Maria Ehab on 11/09/2024.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var checkMark: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
