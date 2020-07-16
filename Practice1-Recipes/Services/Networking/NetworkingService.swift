//
//  NetworkingService.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 14.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Alamofire
import Moya

class NetworkingService {

    private var provider: MoyaProvider<KodeAPI>?

    init(provider: MoyaProvider<KodeAPI> = .init()) {
        self.provider = provider
    }
}

extension NetworkingService {

    func getRecipes(completionHandler: @escaping ([Recipe]) -> Void) {
        provider?.request(.recipes) { result in
            switch result {
            case .success(let response):
                do {
                    let searchResult = try response.map(Recipes.self)
                    completionHandler(searchResult.recipes)
                } catch let decodingError {
                    print("Failed to decode:", decodingError)
                }

            case .failure(let error):
                print(error.errorDescription ?? "")
            }
        }
    }
    
    func getRecipeDetails(uuid: String, completionHandler: @escaping (RecipeDescription) -> Void) {
        provider?.request(.recipeDetails(uuid: uuid)) { result in
            switch result {
            case .success(let response):
                do {
                    let searchResult = try response.map(RecipeDescription.self)
                    completionHandler(searchResult)
                } catch let decodingError {
                    print("Failed to decode:", decodingError)
                }

            case .failure(let error):
                print(error.errorDescription ?? "")
            }
        }
    }

}
