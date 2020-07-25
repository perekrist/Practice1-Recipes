//
//  RecipeImagesViewModel.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 25.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

class RecipeImagesViewModel {

    weak var coordinatorDelegate: RecipeImagesCoordinator?

    var recipeImageURLs: [String]?
    var index: Int?

    init(recipeImageURLs: [String], index: Int) {
        self.recipeImageURLs = recipeImageURLs
        self.index = index
    }
    
    func goBack() {
        coordinatorDelegate?.finish()
    }
    
    func downloadImage(index: Int) {
        print(recipeImageURLs![index])
    }

}
