//
//  Recipe.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 14.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

struct Recipe {
    let uuid: String
    let name: String
    let images: [String]
    let lastUpdated: Int?
    let description: String?
    let instructions: String?
    let difficulty: Int?
    let similar: [Recipe]
    
    init(uuid: String,
        name: String,
        images: [String],
        lastUpdated: Int?,
        description: String?,
        instructions: String?,
        difficulty: Int?,
        similar: [Recipe]) {
        
        self.uuid = uuid
        self.name = name
        self.images = images
        self.lastUpdated = lastUpdated
        self.description = description
        self.instructions = instructions
        self.difficulty = difficulty
        self.similar = similar
    }
}
