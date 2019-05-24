//
//  MovieCCell.swift
//  SkyTest
//
//  Created by Ramiro Lima Vale Neto on 24/05/19.
//  Copyright © 2019 Ramiro Lima Vale Neto. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCVCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var movieImageView: SDAnimatedImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - Function
    
    func configureCell(movie: Movie) {
        titleMovieLabel.text = movie.title
        movieImageView.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
        movieImageView.sd_setImage(with: URL(string: movie.image))
    }
    
}
