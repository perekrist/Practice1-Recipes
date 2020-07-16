//
//  RecipeViewModel.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 16.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

class RecipeViewModel {

    private let networkingService = NetworkingService()

    var recipe: RecipeDescription?
    let uuid: String
    
    var recipeImageURLs: [URL] {
        var urls: [URL] = []
        for i in 0 ..< (recipe?.recipe.images?.count ?? 0) {
            guard let url = URL(string: recipe?.recipe.images![i] ?? "") else {
                preconditionFailure("Failed to load image URL.")
            }
            urls.append(url)
        }
        
        return urls
    }

    init(uuid: String) {
        self.uuid = uuid
    }

}

extension RecipeViewModel {
    
    func getRecipeDetails(uuid: String, completion: @escaping () -> Void) {
        self.networkingService.getRecipeDetails(uuid: uuid) { [weak self] recipe in
            guard let self = self else { return }
            self.recipe = recipe
            print(recipe.recipe.name)
            DispatchQueue.main.async {
                completion()
            }
        }
    }

}
