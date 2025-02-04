//
//  ApiService.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import Foundation

protocol ApiService{
    func fetchData(completion: @escaping (([ApiModel]?, Error?) -> Void))
}
