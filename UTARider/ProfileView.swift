//
//  ProfileView.swift
//  UTARider
//
//  Created by Matthew Ruben on 11/16/17.
//  Copyright © 2017 Rubenmobile. All rights reserved.
//

import UIKit
import Firebase

class ProfileView: UITableViewController {
    
    @IBOutlet var EmailLabel: UILabel!
    @IBOutlet var NameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let username = Auth.auth().currentUser?.displayName else { return }
        NameLabel.text = username
        guard let email = Auth.auth().currentUser?.email else {return }
        EmailLabel.text = email
    }
    
    
    @IBAction func EmailVerifyPressed(_ sender: Any) {
    }
    @IBAction func UpdatePasswordPressed(_ sender: Any) {
    }
    @IBAction func UpdateEmailPressed(_ sender: Any) {
    }
    @IBAction func SignOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOut", sender: nil)
        } catch{
            print(error)
        }
    }

}
