//
//  RecipeImagesViewController.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 25.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class RecipeImagesViewController: UIViewController {
    
    private var viewModel: RecipeImagesViewModel
    private lazy var recipeView = RecipeImagesView()
    
    init(viewModel: RecipeImagesViewModel) {
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
    
    override func viewWillDisappear(_ animated: Bool) {
        if(self.isMovingFromParent) {
            viewModel.goBack()
        }
    }
    
}

extension RecipeImagesViewController {
    
    private func initialSetup() {
        view.backgroundColor = .white
        setupLayout()
        recipeView.setup(with: viewModel)
    }
    
    private func setupLayout() {
        view.addSubview(recipeView)
        recipeView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
