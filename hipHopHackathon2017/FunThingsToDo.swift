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
    
    convenience init(from dict: [String : Any]) {
        
        let name = dict["name"] ?? dict["Name"] ?? "unknown"
        let location = dict["location"] ?? dict["Location"] ?? "unknown"
        
        self.init(name: name as! String, location: location as! String)
        
    }
}

class Beach: FunThingsToDo {
    static func construct(from data: Data) -> [Beach] {
        var objects: [Beach] = []
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let results = jsonData as? [[String : Any]] else {
                throw ParseError.results
            }
            
            for result in results {
                let objectDict = Beach(from: result)
                objects.append(objectDict)
            }
        }
            
        catch {
            print("You got an error: \(error)")
        }
        
        return objects
    }
}


class Park: FunThingsToDo {
    static func construct(from data: Data) -> [Park] {
        var objects: [Park] = []
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let results = jsonData as? [[String : Any]] else {
                throw ParseError.results
            }
            
            for result in results {
                let objectDict = Park(from: result)
                objects.append(objectDict)
            }
        }
            
        catch {
            print("You got an error: \(error)")
        }
        
        return objects
    }
}


class Event: FunThingsToDo {
    static func construct(from data: Data) -> [Event] {
        var objects: [Event] = []
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let results = jsonData as? [String : Any] else {
                throw ParseError.results
            }
            
            if let items = results["items"] as? [[String : Any]] {
                
                for item in items {
                    let objectDict = Event(from: item)
                    objects.append(objectDict)
                }
            }
        }
            
        catch {
            print("You got an error: \(error)")
        }
        
        return objects
    }
}

