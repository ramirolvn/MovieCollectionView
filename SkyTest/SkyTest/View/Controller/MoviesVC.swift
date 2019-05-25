//
//  MoviesVC.swift
//  SkyTest
//
//  Created by Ramiro Lima Vale Neto on 24/05/19.
//  Copyright © 2019 Ramiro Lima Vale Neto. All rights reserved.
//

import Foundation
import UIKit

class MoviesVC: UIViewController {
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var noResultsLabel: UILabel!
    
    
    
    // MARK: - Properties
    
    var movies = [Movie]()
    var numberOfMovies = Int()
    var selectedMovie: Movie?
    var detailsVC: DetailsVC?
    var timer = Timer()
    private var viewmodel = MoviesViewModel(dataService: DataService())
    
    struct Storyboard {
        static let showDetails = "showDetails"
    }
    
    lazy var refreshMovies: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(MoviesVC.handleRefresh(_:)), for: UIControl.Event.valueChanged)
        
        refreshControl.tintColor = .lightGray
        refreshControl.attributedTitle = NSAttributedString(string: "Loading movies data...")
        
        return refreshControl
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.moviesCollectionView.addSubview(self.refreshMovies)
        
        getMovies()
    }
    
    
    // MARK: - Funtions
    
    @objc func getMovies() {
        viewmodel.getMovies()
        viewmodel.didFinishReq = {
            if let movies = self.viewmodel.movies{
                self.numberOfMovies = movies.count
                self.movies = movies
                self.moviesCollectionView.isHidden = false
                self.noResultsLabel.isHidden = true
                self.moviesCollectionView.reloadData()
            }else{
                self.alert(message: "Atenção", title: self.viewmodel.error!)
                
                self.moviesCollectionView.isHidden = true
                self.noResultsLabel.isHidden = false
                
                // Call the function to try get data
                self.tryAgainGetData()
            }
            
        }
    }
    
    func tryAgainGetData() {
        
        // After 15 seconds, execute the function to try to get the data
        self.timer = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(self.getMovies), userInfo: nil, repeats: false)
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        // Call the function again
        getMovies()
        
        // Refresh collection view
        self.moviesCollectionView.reloadData()
        refreshControl.endRefreshing()
    }
    
}

// MARK: - UICollectionViewDataSource

extension MoviesVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfMovies
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as? MovieCVCell {
            
            let movie = movies[indexPath.row]
            
            cell.configureCell(movie: movie)
            return cell
            
        } else {
            return MovieCVCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MovieHeaderView", for: indexPath)
        
        return headerView
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Storyboard.showDetails {
            let details = segue.destination as! DetailsVC
            details.selectedMovie = selectedMovie
        }
    }
    
}


// MARK: - UICollectionViewDelegate

extension MoviesVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedMovie = movies[indexPath.row]
        self.detailsVC?.selectedMovie = selectedMovie
        
        // Call the DetailsVC - Detail UI
        performSegue(withIdentifier: Storyboard.showDetails, sender: selectedMovie)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MoviesVC : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: (collectionViewWidth-30)/2, height: (collectionViewWidth-30)*0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

