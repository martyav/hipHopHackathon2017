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


class Park: FunThingsToDo {}


class Event: FunThingsToDo {}

