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
        
        recipeImageView.setImage(from: self.viewModel?.recipeImageURL)


        setupViews()
        setNeedsLayout()
    }

    private func setupViews() {
        self.accessoryType = .disclosureIndicator
        setupLabels()
        setupLayout()
    }

    private func setupLabels() {
        recipeNameLabel.numberOfLines = 2
        recipeNameLabel.font = .boldSystemFont(ofSize: 22)
        recipeLastUpdatedLabel.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        
        recipeDescriptionLabel.numberOfLines = 2
        recipeDescriptionLabel.font = .systemFont(ofSize: 13)
        recipeLastUpdatedLabel.textColor = #colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)
        
        recipeLastUpdatedLabel.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        recipeLastUpdatedLabel.font = .systemFont(ofSize: 13)
    }

    private func setupLayout() {
        self.addSubview(recipeImageView)
        recipeImageView.contentMode = .scaleAspectFill
        recipeImageView.snp.makeConstraints { make in
            make.height.equalTo(112)
            make.width.equalTo(204)
            make.right.equalTo(self).offset(50)
            make.trailing.equalTo(self.snp.trailingMargin)
            make.top.equalTo(self.snp.topMargin)
            make.bottom.equalTo(self.snp.bottomMargin)
        }
        recipeImageView.layer.cornerRadius = 15.0

        let stackView = UIStackView(arrangedSubviews: [recipeNameLabel, recipeDescriptionLabel, recipeLastUpdatedLabel])
        stackView.spacing = 4
        stackView.axis = .vertical
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.snp.leadingMargin)
            make.trailing.equalTo(recipeImageView.snp.leading).offset(12)
        }
    }

}