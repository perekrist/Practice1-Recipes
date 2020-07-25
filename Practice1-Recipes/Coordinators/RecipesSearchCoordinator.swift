//
//  RecipesSearchCoordinator.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 24.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class RecipesSearchCoordinator: Coordinator {

    let rootViewController: UINavigationController
    lazy var recipesSearchViewModel = RecipesSearchViewModel()
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        recipesSearchViewModel.coordinatorDelegate = self
        let recipesSearchViewController = RecipesSearchViewController(viewModel: recipesSearchViewModel)
        rootViewController.setViewControllers([recipesSearchViewController], animated: false)
    }
}

extension RecipesSearchCoordinator {
    func goToRecipeDetails(recipeId: String) {
        let recipeCoordinator = RecipeCoordinator(rootViewController: self.rootViewController, recipeId: recipeId)
        recipeCoordinator.delegate = self
        addChildCoordinator(recipeCoordinator)
        recipeCoordinator.start()
    }
}

extension RecipesSearchCoordinator: RecipesSearchCoordinatorDelegate {
    func didFinish(from coordinator: RecipeCoordinator) {
        removeChildCoordinator(coordinator)
    }
}

