//
//  SecondViewController.swift
//  hipHopHackathon2017
//
//  Created by C4Q on 6/24/17.
//  Copyright © 2017 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var parkArray = [Park]()
    
    @IBOutlet weak var randomTripButton: UIButton!
    
    @IBAction func randomTripButtonTapped(_ sender: UIButton) {
    }
    @IBOutlet weak var recommendedLeft: UIButton!
    @IBOutlet weak var recommendedMiddle: UIButton!
    @IBOutlet weak var recommendedRight: UIButton!
    @IBAction func recommendedLeftTapped(_ sender: UIButton) {
        getParks()
    }
    @IBAction func recommendedMiddleTapped(_ sender: UIButton) {
    }
    
    @IBAction func recommendedRightTapped(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var useLocationButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getParks()
    }
    
    func getParks() {
        APIRequestManager.manager.getData(endPoint: Endpoints.Parks) { (data: Data?) in
            if data != nil {
                let returnedParks = Park.getParks(from: data!)
                //print(returnedParks)
                self.parkArray = returnedParks
                print("We've got returns: \(self.parkArray.count)")
                DispatchQueue.main.async {
                    // self.activityIndicator.stopAnimating()
                    // self.tableView.reloadData()
                }
            } else {
                print("error loading data!")
                // self.activityIndicator.stopAnimating()
            }
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
