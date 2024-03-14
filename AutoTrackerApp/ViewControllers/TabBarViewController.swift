//
//  TabBarViewController.swift
//  AutoTrackerApp
//
//  Created by OSIIOSdev on 14.03.2024.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    private func setupTabBar() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        
        tabBar.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.layer.borderWidth = 2
        
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}
