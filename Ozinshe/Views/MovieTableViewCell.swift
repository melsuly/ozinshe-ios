//
// Created for Ozinshe in 2023
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var watchView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }

    func configureViews() {
        watchView.layer.cornerRadius = 8
        posterImageView.layer.cornerRadius = 8
    }

    func setData(_ movie: Movie) {
        posterImageView.sd_setImage(with: URL(string: movie.poster.link)!)

        titleLabel.text = movie.name
        subtitleLabel.text = "\(movie.year) • Телехикая • Мультфильм"
    }

}
