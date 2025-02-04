//
//  MainViewViewController.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import UIKit

class MainViewViewController: UIViewController {
    
    var loggedInUser: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        setupUI()
    }
    
    
    private func setupUI() {
        // Add Tab Bar Controller
        let tabBarController = UITabBarController()
        
        let scrollStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let scrollVC = scrollStoryBoard.instantiateViewController(withIdentifier: "ScrollViewController")
        
        let mapStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let mapVC = mapStoryBoard.instantiateViewController(withIdentifier: "MapViewController")
        
        let apiStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let apiVC = apiStoryBoard.instantiateViewController(withIdentifier: "APIViewController")
        

        scrollVC.tabBarItem = UITabBarItem(title: "Scroll", image: nil, tag: 0)
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: nil, tag: 1)
        apiVC.tabBarItem = UITabBarItem(title: "API Data", image: nil, tag: 2)
        
        tabBarController.viewControllers = [scrollVC, mapVC, apiVC]
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
    }
    
    
    
}
