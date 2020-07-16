//
//  RecipeView.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 16.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//


import UIKit

class RecipeView: UIStackView {
    
    var viewModel: RecipeViewModel?
    
    private lazy var recipeImageView = UIImageView()
    private lazy var recipeNameLabel = UILabel()
    private lazy var recipeDescriptionLabel = UILabel()
    private lazy var recipeInstructionLabel = UILabel()
    private lazy var recipeSimilarLabel = UILabel()
    private lazy var difficultyLabel = UILabel()
    private lazy var instructionLabel = UILabel()
    private lazy var similarLabel = UILabel()
    private lazy var difficultyImageView = UIImageView()
    private lazy var difficultyStackView = UIStackView()
    
    override func didMoveToSuperview() {
        setupEpisodeImageView()
        setupLabels()
        setupLayout()
        
    }
    
}

extension RecipeView {
    
    func setup(with viewModel: RecipeViewModel) {
        self.viewModel = viewModel
        viewModel.getRecipeDetails(uuid: viewModel.uuid) {
            let recipe = viewModel.recipe
            
            self.recipeNameLabel.text = recipe?.recipe.name
            self.recipeDescriptionLabel.text = recipe?.recipe.description
            self.recipeInstructionLabel.text = viewModel.filterHTMLLineBreaks(text: recipe?.recipe.instructions ?? "")
            
            self.recipeImageView.setImage(from: self.viewModel?.recipeImageURLs[0])
            
            self.difficultyStackView.axis = .horizontal
            for i in 0 ..< 5 {
                if(i < (recipe?.recipe.difficulty)!) {
                    self.difficultyImageView.image = #imageLiteral(resourceName: "star")
                } else {
                    self.difficultyImageView.image = #imageLiteral(resourceName: "star").alpha(0.3)
                }
                self.difficultyStackView.addSubview(self.difficultyImageView)
            }
        }
        setNeedsLayout()
    }
    
    private func setupLayout() {
        self.axis = .vertical
        self.spacing = 5
        
        let arrangedSubviews = [recipeImageView, recipeNameLabel, recipeDescriptionLabel, difficultyLabel, difficultyStackView, instructionLabel, recipeInstructionLabel, similarLabel, recipeSimilarLabel]
        arrangedSubviews.forEach { self.addArrangedSubview($0) }
    }
    
    private func setupEpisodeImageView() {
        recipeImageView.snp.makeConstraints {
            $0.width.equalTo(recipeImageView.snp.height).multipliedBy(1/1)
        }
    }
    
    private func setupLabels() {
        recipeNameLabel.font = .boldSystemFont(ofSize: 28)
        recipeNameLabel.textAlignment = .left
        recipeNameLabel.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        recipeNameLabel.numberOfLines = 0
        recipeNameLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(20)
        }
        
        recipeDescriptionLabel.font = .systemFont(ofSize: 13)
        recipeDescriptionLabel.textAlignment = .left
        recipeDescriptionLabel.textColor = #colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)
        recipeDescriptionLabel.numberOfLines = 0
        recipeDescriptionLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(20)
        }
        
        recipeInstructionLabel.font = .systemFont(ofSize: 13)
        recipeInstructionLabel.textAlignment = .left
        recipeInstructionLabel.textColor = #colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)
        recipeInstructionLabel.numberOfLines = 0
        recipeInstructionLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(20)
        }
        
        difficultyLabel.text = "Difficulty"
        difficultyLabel.textAlignment = .left
        difficultyLabel.font = .systemFont(ofSize: 18)
        difficultyLabel.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        difficultyLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(20)
        }
        
        instructionLabel.text = "Instruction"
        instructionLabel.textAlignment = .left
        instructionLabel.font = .systemFont(ofSize: 18)
        instructionLabel.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        instructionLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(20)
        }
        
        similarLabel.text = "Similar"
        similarLabel.textAlignment = .left
        similarLabel.font = .systemFont(ofSize: 18)
        similarLabel.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        similarLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(20)
        }
        
        
    }
    
}


