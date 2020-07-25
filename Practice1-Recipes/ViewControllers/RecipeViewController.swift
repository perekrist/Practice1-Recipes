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
        setupTable()
    }
    
    private func getRecipeDetails(uuid: String) {
        viewModel.getRecipeDetails(uuid: uuid) { [weak self] in
        }
    }
    
    private func setupLayout() {
        view.addSubview(recipeView)
        recipeView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    private func setupTable() {
        self.recipeView.similarRecipesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.recipeView.similarRecipesTableView.delegate = self
        self.recipeView.similarRecipesTableView.dataSource = self
    }
}

extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.recipe?.recipe.similar?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.recipeView.similarRecipesTableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = self.viewModel.recipe?.recipe.similar?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = viewModel.recipe?.recipe.similar![indexPath.row]
        let recipeViewModel  = RecipeViewModel(uuid: recipe!.uuid)
        let recipeController = RecipeViewController(viewModel: recipeViewModel)
        navigationController?.pushViewController(recipeController, animated: true)
    }
    
}
