//
//  KodeAPI.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 14.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Moya

enum KodeAPI {
    case recipes
    case recipeDetails(uuid: String)
}

extension KodeAPI: TargetType {

    var baseURL: URL {
        guard let url = URL(string: "https://test.kode-t.ru/") else {
            fatalError("Error in base url: https://test.kode-t.ru/")
        }
        return url
    }

    var path: String {
        switch self {
        case .recipes:
            return "/recipes"
        case .recipeDetails(let uuid):
            return "/recipes/\(uuid)"
        }
    }

    var method: Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .recipes:
            return .requestPlain
        case .recipeDetails:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

}
