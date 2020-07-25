//
//  RecipeView.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 16.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//


import UIKit
import Auk

class RecipeView: UIScrollView {
    
    var viewModel: RecipeViewModel?
    
    var recipeImageView = UIScrollView()
    private lazy var recipeNameLabel = UILabel()
    private lazy var recipeDescriptionLabel = UILabel()
    private lazy var recipeInstructionLabel = UILabel()
    private lazy var difficultyLabel = UILabel()
    private lazy var instructionLabel = UILabel()
    private lazy var similarLabel = UILabel()
    private lazy var difficultyImageView = UIImageView()
    private lazy var difficultyView = UIView()
    var similarRecipesTableView = UITableView()
    
    let recognizer = UITapGestureRecognizer()
    
    var recipe: RecipeDescription?
    
    override func didMoveToSuperview() {
        setupImageViews()
        setupLabels()
        setupTable()
        setupLayout()
    }
    
}

extension RecipeView {
    
    func setup(with viewModel: RecipeViewModel) {
        self.viewModel = viewModel
        viewModel.getRecipeDetails(uuid: viewModel.uuid) {
            self.recipe = viewModel.recipe
            
            self.recipeNameLabel.text = self.recipe?.recipe.name
            self.recipeDescriptionLabel.text = self.recipe?.recipe.description
            self.recipeInstructionLabel.text = viewModel.filterHTMLLineBreaks(text: self.recipe?.recipe.instructions ?? "")
            
            for i in 0 ..< (self.viewModel?.recipeImageURLs.count)! {
                if i < 4 {
                    let image = self.viewModel?.recipeImageURLs[i]
                    self.recipeImageView.auk.show(url: image!)
                }
            }
            
            self.difficultyView = UIView(frame: CGRect(x: 0, y: 0, width: (self.recipe?.recipe.difficulty)! * (20 + 5), height: 20))
            
            var difficulty: [UIView] = []
            for i in 0 ..< 5 {
                if(i < (self.recipe?.recipe.difficulty)!) {
                    let item = UIImageView(frame: CGRect(origin: CGPoint(x: (20 + 5) * CGFloat(i),
                                                                         y: 0), size: CGSize(width: 20, height: 20)))
                    item.image = #imageLiteral(resourceName: "star")
                    difficulty.append(item)
                    self.difficultyView.addSubview(item)
                } else {
                    let item = UIImageView(frame: CGRect(origin: CGPoint(x: (20 + 5) * CGFloat(i),
                                                                         y: 0), size: CGSize(width: 20, height: 20)))
                    item.image = #imageLiteral(resourceName: "star").alpha(0.3)
                    difficulty.append(item)
                    self.difficultyView.addSubview(item)
                }
            }
            
            self.recognizer.addTarget(self, action: #selector(self.handleTapGesture(_: )))
            self.recipeImageView.addGestureRecognizer(self.recognizer)
            
        }
        setNeedsLayout()
    }
    
    private func setupLayout() {
        //        let arrangedSubviews = [recipeImageView, recipeNameLabel, recipeDescriptionLabel, difficultyLabel, difficultyView, instructionLabel, recipeInstructionLabel, similarLabel, similarRecipesTableView]
        
        let arrangedSubviews = [recipeImageView, recipeNameLabel, recipeDescriptionLabel, instructionLabel, recipeInstructionLabel]
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 10
        self.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width - 48)
            $0.trailing.equalTo(self.snp.trailingMargin).offset(-10)
            $0.leading.equalTo(self.snp.leadingMargin).offset(10)
            $0.top.equalTo(self.snp.topMargin).offset(-10)
            $0.bottom.equalTo(self.snp.bottomMargin)
        }
    }
    
    private func setupImageViews() {
        recipeImageView.snp.makeConstraints {
            $0.height.equalTo(270)
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
    
    private func setupTable() {
        similarRecipesTableView.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(20)
        }
    }
    
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        var imagesUrl: [String] = []
        for i in 0 ..< (self.viewModel?.recipeImageURLs.count)! {
            if i < 4 {
                imagesUrl.append((self.viewModel?.recipeImageURLs[i])!)
            }
        }
        
        self.viewModel?.goToRecipeImages(recipeImageURLs: imagesUrl, index: self.recipeImageView.auk.currentPageIndex!)
    }
    
}
