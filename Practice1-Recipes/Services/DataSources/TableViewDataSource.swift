//
//  TableViewDataSource.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 14.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

final class TableViewDataSource<Model, Cell: UITableViewCell>: NSObject, UITableViewDataSource {

    typealias CellConfigurator = (Model, Cell) -> Void

    var models: [Model] = []

    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator

    init(models: [Model], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell: Cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Cell
        cellConfigurator(model, cell)
        return cell
    }

}

extension TableViewDataSource where Model == Recipe {

    static func make(for recipes: [Recipe],
                     reuseIdentifier: String = String(describing: RecipeCell.self)) -> TableViewDataSource {

        return TableViewDataSource(models: recipes, reuseIdentifier: reuseIdentifier,
                                   cellConfigurator: { recipe, cell in
            let cellViewModel = RecipeCellViewModel(recipe: recipe)
            if let cell = cell as? RecipeCell {
                cell.setup(with: cellViewModel)
            }
            cell.layoutIfNeeded()
        })

    }

}
