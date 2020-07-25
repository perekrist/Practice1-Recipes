//
//  RecipeCoordinatorDelegate.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 25.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

protocol RecipeCoordinatorDelegate: class {
    func didFinish(from coordinator: RecipeImagesCoordinator) -> Void
}
