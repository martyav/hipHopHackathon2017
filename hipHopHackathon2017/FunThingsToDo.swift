//
//  FunThingsToDo.swift
//  hiphopHackathon2017
//
//  Created by Marty Avedon on 6/24/17.
//  Copyright © 2017 Marty Hernandez Avedon. All rights reserved.
//

import Foundation


class FunThingsToDo {
    let name: String
    let date: String
    let location: String
    
    init(name: String, date: String, location: String) {
        self.name = name
        self.date = date
        self.location = location
    }
}


class Beach: FunThingsToDo {}


class Park: FunThingsToDo {
    convenience init?(from dict: [String:Any]) throws {
        guard let titleField = dict["title"] as? [String : Any],
            let name = dict["$t"] as? String,
            let date = dict["content"] as? String,
            let location = dict["$t"] as? String else {
                
                throw ParseError.parsingResults
        }
    }
    
    static func getParks(from data: Data) -> [Park]? {
        var parks: [Park]? = []
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let result = jsonData as? [String : Any],
                let feed = result["feed"] as? [String : Any],
                let entries = feed["entry"] as? [[String : Any]] else {
                    throw ParseError.results
            }
            
            for entry in entries {
                if let parkDict = try Park(from: entry) {
                    parks?.append(parkDict)
                }
            }
        }
            
        catch {
            print("You got an error: \(error)")
        }
        
        return parks
    }

}


class Event: FunThingsToDo {}

