//
//  RecipeImagesViewModel.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 25.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class RecipeImagesViewModel: NSObject {
    
    weak var coordinatorDelegate: RecipeImagesCoordinator?
    
    var recipeImageURLs: [String]?
    var index: Int?
    
    init(recipeImageURLs: [String], index: Int) {
        self.recipeImageURLs = recipeImageURLs
        self.index = index
    }
    
    func goBack() {
        coordinatorDelegate?.finish()
    }
    
    func downloadImage(index: Int) {
        let url = URL(string: recipeImageURLs![index])
        let imageData = try! Data(contentsOf: url!)
        let image = UIImage(data: imageData)
        UIImageWriteToSavedPhotosAlbum(image!, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
    
}
