//
//  RecipesSearchViewController.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 14.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

final class RecipesSearchViewController: UITableViewController {

    private var viewModel: RecipesSearchViewModel
    private lazy var searchController = UISearchController(searchResultsController: nil)

    init(viewModel: RecipesSearchViewModel) {
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

    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = false
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = false
        super.viewDidAppear(animated)
    }

}

extension RecipesSearchViewController {

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Sizes.cellHeight
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let emptyStateView = setupEmptyStateView()
        return emptyStateView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height = Sizes.headerHeight(for: tableView)
        return viewModel.recipes.isEmpty
            && searchController.searchBar.text?.isEmpty == true ? height : 0
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return viewModel.recipes.isEmpty
            && searchController.searchBar.text?.isEmpty == false ? Sizes.footerHeight : 0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToRecipeDetails(index: indexPath.row)
    }
}

extension RecipesSearchViewController {

    private func initialSetup() {
        view.backgroundColor = .white
        setupNavigationBar()
        setupSearchBar()
        setupTableView()
        getRecipes()
    }
    
    private func getRecipes() {
        viewModel.getRecipes() { [weak self] in
            guard let self = self else { return }
            self.tableView.dataSource = self.viewModel.dataSource
            self.tableView.reloadData()
        }
    }

    private func setupEmptyStateView() -> UIView {
        let label = UILabel()
        label.text = "No data."
        label.textAlignment = .center
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }

    private func setupNavigationBar() {
        navigationItem.searchController = searchController
        title = "Recipes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort by", style: .plain, target: self, action: #selector(sortRecipes))
        navigationController!.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.delegate = self
    }

    private func setupTableView() {
        tableView.register(RecipeCell.self, forCellReuseIdentifier: String(describing: RecipeCell.self))
        tableView.dataSource = viewModel.dataSource
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    func searchRecipes(with searchText: String) {
        viewModel.deleteRecipes()
        tableView.reloadData()

        guard !searchText.isEmpty else { return }
        viewModel.searchRecipes(with: searchText) { [weak self] in
            guard let self = self else { return }
            self.tableView.dataSource = self.viewModel.dataSource
            self.tableView.reloadData()
        }
    }
    
    @objc func sortRecipes() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Sort by Name", style: .default, handler: { (UIAlertAction) in
            self.viewModel.deleteRecipes()
            self.tableView.reloadData()
            self.viewModel.sortRecipes(sortingType: RecipesSearchViewModel.SortingType.name, completion: {
                self.tableView.dataSource = self.viewModel.dataSource
                self.tableView.reloadData()
            })
        }))

        alert.addAction(UIAlertAction(title: "Sort by Date", style: .default, handler: { (UIAlertAction) in
            self.viewModel.deleteRecipes()
            self.tableView.reloadData()
            self.viewModel.sortRecipes(sortingType: RecipesSearchViewModel.SortingType.updated, completion: {
                self.tableView.dataSource = self.viewModel.dataSource
                self.tableView.reloadData()
            })
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        self.present(alert, animated: true)
    }

}

extension RecipesSearchViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchRecipes(with: searchText)
        
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.deleteRecipes()
        self.tableView.dataSource = self.viewModel.dataSource
        tableView.reloadData()
    }

}

extension RecipesSearchViewController {

    enum Sizes {
        static let cellHeight: CGFloat = 172
        static let footerHeight: CGFloat = 200

        static func headerHeight(for tableView: UITableView) -> CGFloat {
             return tableView.bounds.height / 2
        }
    }

}
