//
//  Network.swift
//  MDApp
//
//  Created by Uğur Duygu on 10.10.2018.
//  Copyright © 2018 mudmud. All rights reserved.
//
import Foundation
import Alamofire

class Network {
    
    static let sharedNetwork = Network()
    
    let jsonDecoder = JSONDecoder()
    let baseUrl = "https://api.themoviedb.org/3/movie"
    
    func buildUrl(paths: String...) -> String{
        var finalPath = ""
        for path in paths{
            finalPath += ("/" + path)
        }
        return baseUrl + finalPath
    }
    
    
    
    let params : Parameters = [
        "api_key" :  "e72ba40a1503319dd2c7ed200da188bb",
        "language" : "en-US"
    ]
    
    
    func getMovies(pageNumber : Int = 1, paths: String = "", onSuccess: @escaping (_ m: [Movie]?) -> Void) {
        var params = self.params
        params["page"] = pageNumber
        Alamofire.request(buildUrl(paths: paths), parameters: params).responseData { response in
            guard let response = response.data else { onSuccess(nil); return }
            let movieResponce = try? self.jsonDecoder.decode(MovieResponse.self, from: response)
            onSuccess(movieResponce?.results)
        }
    }
    
    
    
    func getDetails(id: Int, onSuccess: @escaping (_ d: Details?) -> Void) {
        Alamofire.request(buildUrl(paths: "\(id)"), parameters: params).responseData { response in
            guard let response = response.data else { onSuccess(nil); return }
            let details = try? self.jsonDecoder.decode(Details.self, from: response)
            onSuccess(details)
        }
    }
    
    func getVideos(id: Int, onSuccess: @escaping (_ v: [Videos]?) -> Void) {
        Alamofire.request(buildUrl(paths: "\(id)/videos"), parameters: params).responseData { response in
            guard let response = response.data else { onSuccess(nil); return }
            let videoResponse = try? self.jsonDecoder.decode(VideoResponse.self, from: response)
            onSuccess(videoResponse?.results)
        }
    }
}
