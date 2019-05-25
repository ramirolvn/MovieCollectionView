//
//  MoviesViewModel.swift
//  SkyTest
//
//  Created by Ramiro Neto on 24/05/2019.
//  Copyright © 2019 Ramiro Lima Vale Neto. All rights reserved.
//

import Foundation

import Foundation
class MoviesViewModel {
    private(set) public var error: String?
    private(set) public var movies: [Movie]? {
        didSet {
            self.didFinishReq?()
        }
    }
    
    private var dataService: DataService
    var didFinishReq: (() -> ())?
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func getMovies() {
        dataService.getMovies(handler: {
            (movies, error) in
            if let mvs = movies{
                self.movies = mvs
                self.error = nil
            }else{
                self.error = error!
                self.error = nil
            }
        })
    }
}
