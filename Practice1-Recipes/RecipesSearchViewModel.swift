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
    
}

extension RecipesSearchViewModel {

    func recipe(for indexPath: IndexPath) -> Recipe {
        return recipes[indexPath.row]
    }

    fileprivate func recipesDidLoad(_ recipes: [Recipe]) {
        self.recipes = recipes
        dataSource = .make(for: recipes)
    }

}
