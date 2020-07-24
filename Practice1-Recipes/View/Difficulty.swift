//
//  DifficultyIndicator.swift
//  Practice1-Recipes
//
//  Created by Кристина Перегудова on 24.07.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

@IBDesignable
class DifficultyIndicator: UIView {
    
    @IBInspectable
    var value: Int = 1 {
        didSet {
            removeItems()
            configureIndicator()
        }
    }
    
    @IBInspectable
    var image: UIImage = UIImage() {
        didSet {
            removeItems()
            configureIndicator()
        }
    }
    
    @IBInspectable
    var imageSize: CGSize = CGSize(width: 20, height: 20) {
        didSet {
            removeItems()
            configureIndicator()
        }
    }
    
    @IBInspectable
    var margin: CGFloat = 5 {
        didSet {
            removeItems()
            configureIndicator()
        }
    }
    
    var items = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureIndicator()
    }
    
    private func configureIndicator() {
        let container = UIView(frame: CGRect(x: 0, y: 0,
                                             width: CGFloat(value) * (imageSize.width + margin), height: 20))
        for i in 0..<value {
            let item = UIImageView(frame: CGRect(origin: CGPoint(x: (imageSize.width + margin) * CGFloat(i),
                                                                 y: 0), size: imageSize))
            item.image = image
            items.append(item)
            container.addSubview(item)
        }
        self.addSubview(container)
    }
    
    private func removeItems() {
        items.forEach {$0.removeFromSuperview()}
        items.removeAll()
    }
}
