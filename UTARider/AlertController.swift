//
//  AlertController.swift
//  UTARider
//
//  Created by Matthew Ruben on 11/16/17.
//  Copyright © 2017 Rubenmobile. All rights reserved.
//

import UIKit

class AlertController {
    static func showAlert(_inViewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        _inViewController.present(alert, animated: true, completion: nil)
        
    }
    
}
