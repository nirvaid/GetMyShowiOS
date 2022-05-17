//
//  NetworkUtility.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation

enum NetworkError : String , Error {
    case transportError = "Network error"
    case serverError = "Could not fetch data"
    case parseError = "Could not parse data"
}
struct NetworkUtility {
    static let shared = NetworkUtility()
    private init() {}
    
    func request<T:Decodable>(url: URL, resultType : T.Type , completionHandler: @escaping (Result<[T], NetworkError>) -> Void)
    {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil{
                completionHandler(.failure(.transportError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else{
                completionHandler(.failure(.serverError))
                return
            }
            
            guard 200 ... 299 ~= httpResponse.statusCode else {
                completionHandler(.failure(.serverError))
                return
            }
            
            guard let responseData = data else {
                completionHandler(.failure(.parseError))
                return
            }
            
            do {
                let parsedResponse = try JSONDecoder().decode([T].self, from: responseData)
                completionHandler(.success(parsedResponse))
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }.resume()
    }
}


