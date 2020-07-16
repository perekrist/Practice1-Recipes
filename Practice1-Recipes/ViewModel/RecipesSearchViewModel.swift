//
//  RecipesSearchViewModel.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 14.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class RecipesSearchViewModel {

    var recipes = [Recipe]()
    var dataSource: TableViewDataSource<Recipe, RecipeCell>?
    
    private let networkingService = NetworkingService()
    
}

extension RecipesSearchViewModel {
    
    func getRecipes(completion: @escaping () -> Void) {
        self.networkingService.getRecipes() { [weak self] recipes in
            guard let self = self else { return }
            self.recipesDidLoad(recipes)
            DispatchQueue.main.async {
                completion()
            }
        }
    }

    func recipe(for indexPath: IndexPath) -> Recipe {
        return recipes[indexPath.row]
    }

    private func recipesDidLoad(_ recipes: [Recipe]) {
        self.recipes = recipes
        dataSource = .make(for: recipes)
    }

}
