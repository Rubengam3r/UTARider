//
//  MenuCell.swift
//  UTARider
//
//  Created by Matthew Ruben on 11/21/17.
//  Copyright © 2017 Rubenmobile. All rights reserved.
//

import UIKit

class MenuCell : BaseCell {
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
        }
    }
    var menu: Menu? {
        didSet{
            nameLabel.text = menu?.name
        }
        
    }
    
    //PLACES LABEL IN EACH CELL
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Favorites"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()

    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)

        addConstraintWithFormat(formate: "H:|[v0]|", views: nameLabel)
        addConstraintWithFormat(formate: "V:|[v0]|", views: nameLabel)
        
    }
    
}
