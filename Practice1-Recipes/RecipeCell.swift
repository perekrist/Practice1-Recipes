//
//  RecipeCell.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 14.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit
import SnapKit

class RecipeCell: UITableViewCell {
    
    var viewModel: RecipeCellViewModel?

    private lazy var recipeImageView = UIImageView()
    private lazy var recipeNameLabel = UILabel()
    private lazy var recipeDescriptionLabel = UILabel()
    private lazy var recipeLastUpdatedLabel = UILabel()

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}

extension RecipeCell {

    func setup(with viewModel: RecipeCellViewModel) {
        self.viewModel = viewModel
        let recipe = viewModel.recipe

        recipeNameLabel.text = recipe?.name
        recipeDescriptionLabel.text = recipe?.description
        recipeLastUpdatedLabel.text = "\(recipe?.lastUpdated ?? 0)"

        setupViews()
        setNeedsLayout()
    }

    private func setupViews() {
        self.accessoryType = .disclosureIndicator
        setupLabels()
        setupLayout()
    }

    private func setupLabels() {
        recipeNameLabel.numberOfLines = 0
        recipeNameLabel.font = .boldSystemFont(ofSize: 17)
        
        recipeDescriptionLabel.numberOfLines = 0
        recipeDescriptionLabel.font = .systemFont(ofSize: 15)
        
        recipeLastUpdatedLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
        recipeLastUpdatedLabel.font = .systemFont(ofSize: 15)
    }

    private func setupLayout() {
        self.addSubview(recipeImageView)
        recipeImageView.contentMode = .scaleAspectFit
        recipeImageView.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.leading.equalTo(self.snp.leadingMargin)
            make.top.equalTo(self.snp.topMargin)
            make.bottom.equalTo(self.snp.bottomMargin)
        }

        let stackView = UIStackView(arrangedSubviews: [recipeNameLabel, recipeDescriptionLabel, recipeLastUpdatedLabel])
        stackView.spacing = 4
        stackView.axis = .vertical
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(self.snp.trailingMargin)
            make.leading.equalTo(recipeImageView.snp.trailing).offset(12)
        }
    }

}
