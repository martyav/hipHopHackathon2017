//
//  FirstViewController.swift
//  hiphopHackathon2017
//
//  Created by C4Q on 6/24/17.
//  Copyright © 2017 Marty Hernandez Avedon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var mapBackgroundImageView: UIImageView!
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func getStartedButton(_ sender: UIButton) {
        print("Button pressed")
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
