//
//  Location.swift
//  rainyshiny
//
//  Created by Julian Bergmann on 13.08.17.
//  Copyright © 2017 Julian Bergmann. All rights reserved.
//

import CoreLocation

class Location {
    static /* accessible from anywhere of the app */ var sharedInstance = Location()
    private init() {  }
    
    var latitude: Double!
    var longitude: Double!
    
}
