//
//  Service.swift
//  Geliyo
//
//  Created by Oguz Demırhan on 31.07.2021.
//

import Foundation

class Service {
    
    let apiURL = "https://fakestoreapi.com/products"
    static let shared = Service()
    
    func fetchProducts(completionHandler:@escaping (ProductModels) -> ()){
        guard let requestURL = URL(string: apiURL) else {return}
        
        let task = URLSession.shared.dataTask(with: requestURL) { data, resp, err in
            
            guard let data = data else {return}
            do {
                let products = try JSONDecoder().decode(ProductModels.self, from: data)
                completionHandler(products)
            }
            catch(let error){
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
