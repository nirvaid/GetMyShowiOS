//
//  ShowSearchNetworkService.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation

enum FetchError : String , Error {
    case FetchError = "Error In Fetching"
}

protocol ShowSearchNetworkServiceType{
    func fetchShowListings(searchString : String, completionHandler: @escaping (Result<[Shows],FetchError>) -> ())
}

struct ShowSearchNetworkService : ShowSearchNetworkServiceType {
    func fetchShowListings(searchString : String, completionHandler: @escaping (Result<[Shows],FetchError>) -> Void){
        
        let searchUrlString = BaseUrlString + ShowSearchUrlString + searchString
        
        guard let url = URL(string: searchUrlString) else {
            assertionFailure("Cannot create url")
            return
        }
        
        NetworkUtility.shared.request(url: url, resultType: Shows.self) { result in
            switch result {
            case .success(let response):
                completionHandler(.success(response))
            case .failure(_):
                completionHandler(.failure(.FetchError))
            }
        }
    }
}
