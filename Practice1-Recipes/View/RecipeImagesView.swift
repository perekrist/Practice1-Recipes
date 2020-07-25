//
//  RecipeImagesView.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 25.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit
import Auk

class RecipeImagesView: UIView {
    
    var viewModel: RecipeImagesViewModel?
    
    private lazy var downloadButton = UIButton()
    private lazy var recipeImageView = UIScrollView()
        
    override func didMoveToSuperview() {
        setupButton()
        setupLayout()
    }
}

extension RecipeImagesView {
    
    func setup(with viewModel: RecipeImagesViewModel) {
        self.viewModel = viewModel
        for i in 0 ..< (self.viewModel?.recipeImageURLs?.count ?? 0) {
            if i < 4 {
                let image = self.viewModel?.recipeImageURLs![i]
                self.recipeImageView.auk.show(url: image!)
            }
        }
        while self.viewModel?.index != self.recipeImageView.auk.currentPageIndex {
            self.recipeImageView.auk.scrollToNextPage()
        }
        setNeedsLayout()
    }
    
    private func setupLayout() {
        
        let arrangedSubviews = [downloadButton, recipeImageView]
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 10
        self.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.trailing.equalTo(self.snp.trailingMargin)
            $0.leading.equalTo(self.snp.leadingMargin)
            $0.top.equalTo(self.snp.topMargin)
            $0.bottom.equalTo(self.snp.bottomMargin)
        }
    }
    
    private func setupButton() {
        downloadButton = UIButton(type: .system)
        downloadButton.setTitle("Download current image", for: .normal)
        downloadButton.tintColor = .blue
        downloadButton.addTarget(self, action: #selector(downloadImage), for: .touchUpInside)
    }
    
    @objc private func downloadImage() {
        self.viewModel?.downloadImage(index: self.recipeImageView.auk.currentPageIndex!)
    }
    
    
}

