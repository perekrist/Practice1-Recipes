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

    func fetchPodcasts(completionHandler: @escaping ([Recipe]) -> Void) {
        provider?.request(.recipes) { result in
            switch result {
            case .success(let response):
                do {
                    let searchResult = try response.map(Recipes.self)
                    completionHandler(searchResult.results)
                } catch let decodingError {
                    print("Failed to decode:", decodingError)
                }

            case .failure(let error):
                print(error.errorDescription ?? "")
            }
        }
    }

}
