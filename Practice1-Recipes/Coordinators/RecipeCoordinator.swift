//
//  RecipeCoordinator.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 24.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class RecipeCoordinator: Coordinator {
    
    
    let rootViewController: UINavigationController
        
    weak var delegate: RecipesSearchCoordinatorDelegate?
    
    
    let recipeId: String
    
    lazy var recipeDetailsViewModel: RecipeViewModel! = {
        let viewModel = RecipeViewModel(uuid: self.recipeId)
        viewModel.coordinatorDelegate = self
        return viewModel
    }()

    init(rootViewController: UINavigationController,
         recipeId: String) {
        self.rootViewController = rootViewController
        self.recipeId = recipeId
    }
    
    override func start() {
        let recipeViewController = RecipeViewController(viewModel: recipeDetailsViewModel)
        rootViewController.pushViewController(recipeViewController, animated: true)
    }
    
    override func finish() {
        delegate?.didFinish(from: self)
    }
}

extension RecipeCoordinator {
    func goToRecipeImages(recipeImageURLs: [String], index: Int) {
        let recipeImagesCoordinator = RecipeImagesCoordinator(rootViewController: self.rootViewController, recipeImageURLs: recipeImageURLs, index: index)
        recipeImagesCoordinator.delegate = self
        addChildCoordinator(recipeImagesCoordinator)
        recipeImagesCoordinator.start()
    }
}

extension RecipeCoordinator:  RecipeCoordinatorDelegate{
    func didFinish(from coordinator: RecipeImagesCoordinator) {
        removeChildCoordinator(coordinator)
    }
}
