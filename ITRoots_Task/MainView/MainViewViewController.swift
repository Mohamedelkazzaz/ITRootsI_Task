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
        
        // Tab 1: Horizontal and Vertical Scrolling
        scrollVC.tabBarItem = UITabBarItem(title: "Scroll", image: nil, tag: 0)
        
        // Tab 2: Map with Current Location
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: nil, tag: 1)
        
        // Tab 3: Online API Data with Offline Support
        let tab3 = UIViewController()
        tab3.tabBarItem = UITabBarItem(title: "API Data", image: nil, tag: 2)
        
        tabBarController.viewControllers = [scrollVC, mapVC, tab3]
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
    }
}
