//
//  OnboardingCollectionViewCell.swift
//  Speedo Transfer
//
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var onboardingImgView: UIImageView!
    @IBOutlet weak var onboardingTitleLabel: UILabel!
    @IBOutlet weak var onboardingContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func customizeCell(page: OnboardingPage) {
        self.onboardingImgView.image = page.image
        self.onboardingTitleLabel.text = page.title
        self.onboardingContentLabel.text = page.content
    }

}
