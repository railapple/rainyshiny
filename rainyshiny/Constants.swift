//
//  Constants.swift
//  rainyshiny
//
//  Created by Julian Bergmann on 08.08.17.
//  Copyright © 2017 Julian Bergmann. All rights reserved.
//

import Foundation

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=8057d36f6276402d7b44475be7599038"

let FORECAST_URL = "https://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=8057d36f6276402d7b44475be7599038"


typealias DownloadComplete = () -> ()
