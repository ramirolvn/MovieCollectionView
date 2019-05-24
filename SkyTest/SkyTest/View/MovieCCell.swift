//
//  MovieCCell.swift
//  SkyTest
//
//  Created by Ramiro Lima Vale Neto on 24/05/19.
//  Copyright © 2019 Ramiro Lima Vale Neto. All rights reserved.
//

import UIKit

class MovieCVCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var actyIndicator: UIActivityIndicatorView!
    
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.actyIndicator.startAnimating()
    }
    
    
    // MARK: - Function
    
    func configureCell(movie: Movie) {
        titleMovieLabel.text = movie.title
    }
    
}
