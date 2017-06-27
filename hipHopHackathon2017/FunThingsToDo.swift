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
    let location: String
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}


class Beach: FunThingsToDo {}


class Park: FunThingsToDo {
    
    convenience init(from dict: [String : String]) {
        
        let name = dict["name"] ?? "unknown"
        let location = dict["location"] ?? "unknown"
        
        self.init(name: name, location: location)
        
    }
    
    static func getParks(from data: Data) -> [Park] {
        var parks: [Park] = []
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let results = jsonData as? [[String : String]] else {
                throw ParseError.results
            }
            
            for result in results {
                let parkDict = Park(from: result)
                parks.append(parkDict)
            }
        }
            
        catch {
            print("You got an error: \(error)")
        }
        
        return parks
    }
    
}


class Event: FunThingsToDo {}

