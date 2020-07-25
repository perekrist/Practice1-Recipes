//
//  RecipesSearchCoordinatorDelegate.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 24.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

protocol RecipesSearchCoordinatorDelegate: class {
    func didFinish(from coordinator: RecipeCoordinator) -> Void
}
