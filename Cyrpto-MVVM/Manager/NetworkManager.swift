//
//  NetworkManager.swift
//  Cyrpto-MVVM
//
//  Created by DenizCagilligecit on 17.12.2020.
//  Copyright © 2020 Deniz Cagilligecit. All rights reserved.
//

import Foundation

enum CurError:String, Error {
    case error = "adadsad"
}


class NetworkManager {
     static let shared = NetworkManager()
    
    func getCurrencies(completed: @escaping (Result<[String:Currency],CurError>)->()) {
        
        let url = URL(string: "https://api.coingecko.com/api/v3/exchange_rates")
                
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                completed(.failure(.error))
                return
            }
            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else {
                completed(.failure(.error))
                return
            }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let res = try decoder.decode(Rates.self, from: data)
                    completed(.success(res.rates))
                }
                catch {
                    completed(.failure(.error))
                   return
                }
                
            }
           
        }.resume()
        

    }
    
    
}
