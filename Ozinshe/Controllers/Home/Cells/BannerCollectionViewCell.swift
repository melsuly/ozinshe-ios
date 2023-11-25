//
// Created for Ozinshe in 2023
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryBadgeView: UIView!
    @IBOutlet weak var categoryBadgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }

    func configureViews() {
        posterImageView.layer.cornerRadius = 12
        categoryBadgeView.layer.cornerRadius = 8
    }
}
