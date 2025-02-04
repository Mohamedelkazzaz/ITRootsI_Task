//
//  ApiViewModel.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import Foundation
import Network
import UIKit

class ApiViewModel {
    
    var dataArray: [ApiModel]? {
        didSet {
            bindingData(dataArray,nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    var localData: [Data] = []
    var networkCheck = NetworkCheck.sharedInstance()
    let apiService: ApiService
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var bindingData: (([ApiModel]?,Error?) -> Void) = {_, _ in }
    init(apiService: ApiService = NetworkManager()) {
        self.apiService = apiService
    }
    
    func fetchData() {
        apiService.fetchData() { data, error in
            if let data = data {
                self.dataArray = data
                DBManager.sharedInstanse.addData(appDelegate: self.appDelegate, apiModels: self.dataArray ?? [])
            }
            if let error = error {
                self.error = error
            }
        }
    }
}

extension ApiViewModel{

    func getDatas() -> [ApiModel]?{
        return dataArray
    }
    
    func getData(indexPath: IndexPath) -> ApiModel?{
//        DBManager.sharedInstanse.addData(appDelegate: self.appDelegate, title: self.dataArray?[indexPath.row].title ?? "", body: self.dataArray?[indexPath.row].body ?? "")
        return dataArray?[indexPath.row]
    }
    
}
