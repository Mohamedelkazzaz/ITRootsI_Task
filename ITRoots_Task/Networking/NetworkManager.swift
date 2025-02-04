//
//  NetworkManager.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import Foundation

class NetworkManager: ApiService{
    
    func fetchData(completion: @escaping (([ApiModel]?, Error?) -> Void)) {
        if let url = URL(string: Url().url){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    guard let decodedData = try? JSONDecoder().decode([ApiModel].self, from: data) else{ return}
                    completion(decodedData,nil)
                    print(decodedData)
                    
                }
                if let error = error {
                    completion(nil,error)
                }
            }.resume()
        }
    }
}
