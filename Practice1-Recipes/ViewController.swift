//
//  ViewController.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 13.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var searchController: UISearchController!
    let tableViewController = UITableViewController(style: .plain)
    
    var allItems = ["Firsrt", "Second", "Third"]
    var cellIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Recipes"
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort by", style: .plain, target: self, action: #selector(sortByTapped))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)

        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.layer.borderColor = .none

        navigationItem.searchController = searchController
        
        createTableView()
        view.addSubview(tableViewController.tableView)
                
        setUpConstrains()
    }
    
    @objc func sortByTapped() {
        print("sortByTapped")
    }
    
    func createTableView() {
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
    }

}

