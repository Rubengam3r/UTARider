//
//  TripPlannerView.swift
//  UTARider
//
//  Created by Matthew Ruben on 11/26/17.
//  Copyright © 2017 Rubenmobile. All rights reserved.
//

import UIKit

class TripPlannerView : UITableViewController {
    
    @IBOutlet var startLocationTextField: UITextField!
    @IBOutlet var endLocationTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trip Planner"
    }
    @IBAction func PlanTripTapped(_ sender: Any) {
    }
    
}
