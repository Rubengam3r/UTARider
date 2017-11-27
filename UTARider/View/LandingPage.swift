//
//  LandingPage.swift
//  UTARider
//
//  Created by Matthew Ruben on 11/16/17.
//  Copyright © 2017 Rubenmobile. All rights reserved.
//

import UIKit

class LandingScreen: UIViewController {
    //CHANGE STATUS BAR TO WHITE
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    @IBAction func CallCustomerServiceTapped(_ sender: Any) {
        let dispatchNum: NSURL = URL(string: "TEL://8017433882")! as NSURL
        UIApplication.shared.open(dispatchNum as URL, options: [:], completionHandler: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Do any additional setup after loading the view
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
