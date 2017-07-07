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
    var beachArray = [Beach]()
    var eventArray = [Event]()
    
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
        getBeaches()
    }
    
    @IBAction func recommendedRightTapped(_ sender: UIButton) {
        getEvents()
    }
    
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var useLocationButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getParks() {
        APIRequestManager.manager.getData(endPoint: Endpoints.Parks) { (data: Data?) in
            if data != nil {
                let returnedParks = Park.construct(from: data!)
                //print(returnedParks)
                self.parkArray = returnedParks
                print("We've got parks: \(self.parkArray.count)")
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
    
    func getBeaches() {
        APIRequestManager.manager.getData(endPoint: Endpoints.Beaches) { (data: Data?) in
            if data != nil {
                let returnedBeaches = Beach.construct(from: data!)
                //print(returnedParks)
                self.beachArray = returnedBeaches
                print("We've got beaches: \(self.beachArray.count)")
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
    
    func getEvents() {
        APIRequestManager.manager.getData(endPoint: Endpoints.Events) { (data: Data?) in
            if data != nil {
                let returnedEvents = Event.construct(from: data!)
                //print(returnedParks)
                self.eventArray = returnedEvents
                print("We've got events: \(self.eventArray.count)")
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
