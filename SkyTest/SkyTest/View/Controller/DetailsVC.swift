//
//  DetailsVC.swift
//  SkyTest
//
//  Created by Ramiro Lima Vale Neto on 24/05/19.
//  Copyright © 2019 Ramiro Lima Vale Neto. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsVC: UIViewController, UIScrollViewDelegate{
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Properties
    var selectedMovie: Movie!
    
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.scrollView.delegate = self
        updateUI()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
    
    fileprivate func updateUI() {
        self.navigationItem.title = selectedMovie.title
        movieImageView.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
        self.setImage()
        durationLabel.text = selectedMovie.duration
        yearLabel.text = selectedMovie.year
        overviewLabel.text = selectedMovie.overview
    }
    
    fileprivate func setImage(){
        movieImageView.sd_setImage(with: URL(string: selectedMovie.image), completed: {
            (image, error, cacheType, url) -> Void in
            if (error != nil){
                self.movieImageView.sd_setImage(with: URL(string: self.selectedMovie._image2), completed: {
                    (image, error, cacheType, url) -> Void in
                    if (error != nil){
                        self.movieImageView.sd_setImage(with: URL(string: self.selectedMovie._image3), completed: {
                            (image, error, cacheType, url) -> Void in
                            if (error != nil){
                                self.setImage()
                            }
                        })
                    }
                })
            }
        })
    }
    
    
}
