//
//  DetailsVC.swift
//  SkyTest
//
//  Created by Ramiro Lima Vale Neto on 24/05/19.
//  Copyright © 2019 Ramiro Lima Vale Neto. All rights reserved.
//

import UIKit
import Alamofire

class DetailsVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    // MARK: - Properties
    
    var movies: [Movie]?
    var selectedMovie: Movie?
    
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Call the function
        updateUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.movies?.removeAll()
        self.selectedMovie = nil
    }
    
    
    // MARK: - Functions
    
    func updateUI() {
        
        if let movie = selectedMovie {
            
            self.navigationItem.title = movie.title
            
            durationLabel.text = movie.duration
            yearLabel.text = movie.year
            overviewLabel.text = movie.overview
            
        } else {
            self.navigationItem.title = "Details Movie"
        }
    }
    
    
}
