//
//  FunThingsToDo.swift
//  hiphopHackathon2017
//
//  Created by Marty Avedon on 6/24/17.
//  Copyright © 2017 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

protocol ConstructFromJSON {
    func construct(from data: Data) -> [FunThingsToDo]
}

class FunThingsToDo: ConstructFromJSON {
    let name: String
    let location: String
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
    
    convenience init(from dict: [String : Any]) {
        
        let name = dict["name"] ?? dict["Name"] ?? "unknown"
        let location = dict["location"] ?? dict["Location"] ?? "unknown"
        
        self.init(name: name as! String, location: location as! String)
        
    }
    
    internal func construct(from data: Data) -> [FunThingsToDo] {
        var objects: [FunThingsToDo] = []
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let results = jsonData as? [[String : Any]] else {
                throw ParseError.results
            }
            
            for result in results {
                let objectDict = FunThingsToDo(from: result)
                objects.append(objectDict)
            }
        }
            
        catch {
            print("You got an error: \(error)")
        }
        
        return objects
    }
}

class Beach: FunThingsToDo {
    convenience init(from dict: [String : Any]) {
        
        let name = dict["Name"] ?? "unknown"
        let location = dict["Location"] ?? "unknown"
        
        self.init(name: name as! String, location: location as! String)
        
    }
    
}


class Park: FunThingsToDo {
}


class Event: FunThingsToDo {}

