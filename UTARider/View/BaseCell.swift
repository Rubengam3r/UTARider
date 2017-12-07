//
//  BaseCell.swift
//  UTARider
//
//  Created by Matthew Ruben on 11/21/17.
//  Copyright © 2017 Rubenmobile. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    func setupViews() {
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
