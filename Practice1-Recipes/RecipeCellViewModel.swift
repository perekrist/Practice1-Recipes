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
    
    
    var recipeImageURL: [URL] {
        var urls: [URL] = []
        for i in 0 ..< (recipe?.images.count ?? 0) {
            guard let url = URL(string: recipe?.images[i] ?? "") else {
                preconditionFailure("Failed to load image URL.")
            }
            urls.append(url)
        }
        
        return urls
    }
    
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
}
