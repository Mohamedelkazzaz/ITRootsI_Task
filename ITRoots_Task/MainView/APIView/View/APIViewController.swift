//
//  APIViewController.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import UIKit
import Network

class APIViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataViewModel = ApiViewModel()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var data = [Data]()
    var networkCheck = NetworkCheck.sharedInstance()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "APITableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        dataViewModel.fetchData()
        dataViewModel.bindingData = { data, error in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        
        if let error = error{
            print(error.localizedDescription)
        }
    }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        data = DBManager.sharedInstanse.fetchData(appDelegate: appDelegate)
        tableView.reloadData()
    }


}


extension APIViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Data"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if networkCheck.currentStatus == .unsatisfied{
            let alert = UIAlertController(title: "Warning!", message: "Please check your internet connection", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return data.count
        }else{
            return dataViewModel.getDatas()?.count ?? 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if networkCheck.currentStatus == .unsatisfied{
            let alert = UIAlertController(title: "Warning!", message: "Please check your internet connection", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! APITableViewCell
            cell.selectionStyle = .none
            cell.titleLabel.text = data[indexPath.row].title
            cell.bodyTextView.text = data[indexPath.row].body
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! APITableViewCell
            cell.selectionStyle = .none
            cell.setup(data: dataViewModel.getData(indexPath: indexPath))
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
