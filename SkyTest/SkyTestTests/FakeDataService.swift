//
//  FakeDataService.swift
//  SkyTestTests
//
//  Created by Ramiro Neto on 24/05/2019.
//  Copyright © 2019 Ramiro Lima Vale Neto. All rights reserved.
//
@testable import SkyTest
import Foundation
import ObjectMapper

class FakeDataService: DataService {
    private let fakeDataDict = [["title": "Movie 1", "overview": "Just a test movie", "duration" : "1h 55m", "release_year":"2017", "cover_url":"coverIMG1", "backdrops_url": ["backdrops_url1","backdrops_url2"], "id": "1"], ["title": "Movie 2", "overview": "Just a test movie 2", "duration" : "3h 45m", "release_year":"1999", "cover_url":"coverIMG2", "backdrops_url": ["backdrops_url1","backdrops_url2"], "id": "2"], ["title": "Movie 3", "overview": "Just a test movie 3", "duration" : "3h 34m", "release_year":"2013", "cover_url":"coverIMG3", "backdrops_url": ["backdrops_url1","backdrops_url2"], "id": "3"]] as [[String : Any]]
    
    
    func getFakeMoviesTest(sucess: Bool) -> ([Movie]?,String?){
        if sucess {
            var movies = [Movie]()
            for obj in fakeDataDict {
                if let movie = Movie(map: Map.init(mappingType: .fromJSON, JSON: obj)){
                    movies.append(movie)
                }
            }
            if movies.count > 0{return(movies,nil)}
                return (nil,"Nenhum filme encontrado!")
        }
        return (nil,"Erro na requisição!")
    }
}
