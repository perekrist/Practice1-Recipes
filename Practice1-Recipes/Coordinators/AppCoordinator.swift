//
//  AppCoordinator.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 24.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        return UINavigationController(rootViewController: UIViewController())
    }()
        
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        guard let window = window else {
            return
        }
        
        let recipesSearchCoordinator = RecipesSearchCoordinator(rootViewController: rootViewController)
        self.addChildCoordinator(recipesSearchCoordinator)
        recipesSearchCoordinator.start()
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
