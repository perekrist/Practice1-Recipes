//
//  RecipeViewController.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 16.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    private var viewModel: RecipeViewModel
    private lazy var recipeView = RecipeView()

    init(viewModel: RecipeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

}

extension RecipeViewController {

    private func initialSetup() {
        view.backgroundColor = .white
        setupLayout()
        getRecipeDetails(uuid: viewModel.uuid)
        recipeView.setup(with: viewModel)
    }
    
    private func getRecipeDetails(uuid: String) {
        viewModel.getRecipeDetails(uuid: uuid) { [weak self] in
            
        }
    }

    private func setupLayout() {
        view.addSubview(recipeView)
        recipeView.snp.makeConstraints { make in
            make.top.left.equalTo(self.view.safeAreaLayoutGuide).offset(24)
            make.bottom.right.equalTo(self.view.safeAreaLayoutGuide).offset(-24)
        }
    }
}
