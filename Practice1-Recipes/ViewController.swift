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
                
        setUpConstrains()
    }
    
    @objc func sortByTapped() {
        print("sortByTapped")
    }
    
    


}

