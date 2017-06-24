//
//  ViewController.swift
//  hipHopHackathon2017
//
//  Created by Marty Avedon on 6/24/17.
//  Copyright © 2017 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var parkArray = [Park]()

    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
    print("GS button tapped")}
    
    override func viewDidLoad() {
                super.viewDidLoad()
    }
    
    func getParks() {
        APIRequestManager.manager.getData(endPoint: Endpoints.Parks) { (data: Data?) in
            if data != nil {
                if let returnedParks = Park.getParks(from: data!) {
                    self.parkArray = returnedParks
                    print("We've got returns: \(self.parkArray.count)")
                    DispatchQueue.main.async {
                       // self.activityIndicator.stopAnimating()
                       // self.tableView.reloadData()
                    }
                }
            } else {
                print("error loading data!")
                // self.activityIndicator.stopAnimating()
            }
        }
    }
    
}

