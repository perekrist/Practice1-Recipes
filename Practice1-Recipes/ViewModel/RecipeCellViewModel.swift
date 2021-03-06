//
//  RecipeCellViewModel.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 14.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

class RecipeCellViewModel {
    
    var recipe: Recipe?
    
    var recipeImageURL: URL {
        guard let url = URL(string: recipe?.images![0] ?? "") else {
            preconditionFailure("Failed to load image URL.")
        }
        
        return url
    }
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
}
