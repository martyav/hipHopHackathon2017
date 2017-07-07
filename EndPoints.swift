//
//  Endpoints.swift
//  hiphopHackathon2017
//
//  Created by Marty Avedon on 6/24/17.
//  Copyright © 2017 Marty Hernandez Avedon. All rights reserved.
//

import Foundation

enum Endpoints: String {
    case Parks = "https://data.cityofnewyork.us/resource/4xyq-5bdm.json"
    case Beaches = "https://www.nycgovparks.org/bigapps/DPR_Beaches_001.json"
    /* We are using NYC Developer Portal's events API now, becase it is perfect.
       See https://dev-mgmt.cityofnewyork.us/docs/calendar/v1
    */
    case Events = "https://api.cityofnewyork.us/calendar/v1/search.htm?app_id=aee059e5&app_key=59e6ce0be672598cebb17182e153a620"
}

enum EventsAPI: String {
    case Id = "aee059e5"
    case Key = "59e6ce0be672598cebb17182e153a620"
}
