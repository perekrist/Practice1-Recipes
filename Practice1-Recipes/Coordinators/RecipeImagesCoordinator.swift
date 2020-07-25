//
//  RecipeImagesCoordinator.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 25.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class RecipeImagesCoordinator: Coordinator {
    
    let rootViewController: UINavigationController
        
    weak var delegate: RecipeCoordinatorDelegate?
    
    let recipeImageURLs: [String]
    let index: Int
    
    lazy var recipeImagesViewModel: RecipeImagesViewModel! = {
        let viewModel = RecipeImagesViewModel(recipeImageURLs: recipeImageURLs, index: index)
        viewModel.coordinatorDelegate = self
        return viewModel
    }()

    init(rootViewController: UINavigationController,
         recipeImageURLs: [String],
         index: Int) {
        self.rootViewController = rootViewController
        self.recipeImageURLs = recipeImageURLs
        self.index = index
    }
    
    override func start() {
        let recipeImagesViewController = RecipeImagesViewController(viewModel: recipeImagesViewModel)
        rootViewController.pushViewController(recipeImagesViewController, animated: true)
    }
    
    override func finish() {
        delegate?.didFinish(from: self)
    }
}
