//
//  DataService.swift
//  SkyTest
//
//  Created by Ramiro Neto on 24/05/2019.
//  Copyright © 2019 Ramiro Lima Vale Neto. All rights reserved.
//

import Alamofire
import ObjectMapper


class DataService {
    
    private let URL_API = "https://sky-exercise.herokuapp.com/api/Movies"
    
    func getMovies(handler: @escaping (([Movie]?,(String?))->Void)){
        Alamofire.request(URL_API, method: .get).responseJSON
            { response in
                if response.result.isSuccess {
                    let result = response.result
                    
                    if let dict = result.value as? [Dictionary<String,Any>] {
                        var movies = [Movie]()
                        for obj in dict {
                            if let movie = Movie(map: Map.init(mappingType: .fromJSON, JSON: obj)){
                                movies.append(movie)
                            }
                        }
                        if movies.count > 0{handler(movies,nil)}
                        else{handler(nil,"Nenhum filme encontrado!")}
                    }else{handler(nil,"Erro na requisição!")}
                } else {
                    handler(nil,"Erro na requisição!")
                }
        }
    }
}
