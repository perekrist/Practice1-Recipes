//
//  UIImageView+Extensions.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 14.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {

    func setImage(from url: URL?) {
        guard let url = url else {
            preconditionFailure("Failed to load image URL.")
        }
        kf.setImage(with: url)
    }

    func setImage(from url: URL?, completionHandler: ((UIImage) -> Void)? = nil) {
        guard let url = url else {
            preconditionFailure("Failed to load image URL.")
        }
        kf.setImage(with: url) { result in
            switch result {
            case .success(let retrieveImageResult):
                completionHandler?(retrieveImageResult.image)
            case .failure(let error):
                assertionFailure(error.errorDescription ?? "")
            }
        }
    }

}
