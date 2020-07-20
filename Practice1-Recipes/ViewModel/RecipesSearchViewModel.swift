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
    var filteredRecipes = [Recipe]()
    var dataSource: TableViewDataSource<Recipe, RecipeCell>?
    var numberOfRows = 0
    
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
    
    func searchRecipes(with query: String, completion: @escaping () -> Void) {
        guard !query.isEmpty else { return }
        print(query.lowercased())
        filteredRecipes = recipes.filter { recipe -> Bool in
            return (recipe.name.lowercased().contains(query.lowercased()) ||
                recipe.instructions!.lowercased().contains(query.lowercased()) ||
                recipe.description?.lowercased().contains(query.lowercased()) ?? false)
        }
        dataSource = .make(for: filteredRecipes)
        completion()
    }
    
    func sortRecipes(sortingType: SortingType, completion: @escaping () -> Void) {
        switch sortingType {
        case .name:
            filteredRecipes = recipes.sorted(by: { $0.name < $1.name })
        case .updated:
            filteredRecipes = recipes.sorted(by: { $0.lastUpdated! < $1.lastUpdated! })
        }
        dataSource = .make(for: filteredRecipes)
        completion()
    }
    
    func deleteRecipes() {
        filteredRecipes.removeAll()
        dataSource = .make(for: recipes)
    }
    
    func recipe(for indexPath: IndexPath) -> Recipe {
        return recipes[indexPath.row]
    }
    
    private func recipesDidLoad(_ recipes: [Recipe]) {
        self.recipes = recipes
        dataSource = .make(for: recipes)
    }
    
}

extension RecipesSearchViewModel {
    enum SortingType {
        case name, updated
    }
}
