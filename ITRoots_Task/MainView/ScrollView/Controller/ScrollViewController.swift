//
//  ScrollViewController.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ScrollViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.register(UINib(nibName: "ScrollCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "ScrollTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
}

extension ScrollViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScrollCollectionViewCell
        cell.nameLabel.text = viewModel.collectionArray[indexPath.row]
        cell.imageView.image = viewModel.teamPhotosArray[indexPath.row]
        return cell
    }
    
    
}

extension ScrollViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ScrollTableViewCell
        cell.selectionStyle = .none
        cell.leagueImageView.image = viewModel.leaguesImages[indexPath.row]
        cell.leagueNameLabel.text = viewModel.leagues[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Leagues"
    }
}
