//
//  RecipeViewModel.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 14.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import Alamofire

class RecipeViewModel: ObservableObject {
    
    var recipes: Recipes?
    var recipe: Recipe?
    
    private let baseURL = "https://test.kode-t.ru"
    
    init() {
        getRecipes()
    }
    
    private func getRecipes() {
        let url = URL(string: baseURL + "/recipes")
        
        AF.request(url!, method: .get).responseData(completionHandler: { (response) in
            switch response.result {
            case .success(let data):
                do {
                    self.recipes = try JSONDecoder().decode(Recipes.self, from: data)
                }
                catch {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func getDetails(uuid: Int) {
        let url = URL(string: baseURL + "/recipes/\(uuid)")
        
        AF.request(url!, method: .get).responseData(completionHandler: { (response) in
            switch response.result {
            case .success(let data):
                do {
                    self.recipe = try JSONDecoder().decode(Recipe.self, from: data)
                }
                catch {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
            }
        })
    }
}
