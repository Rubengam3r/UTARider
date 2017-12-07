//
//  Extensions.swift
//  UTARider
//
//  Created by Matthew Ruben on 11/21/17.
//  Copyright © 2017 Rubenmobile. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintWithFormat(formate: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formate, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}
