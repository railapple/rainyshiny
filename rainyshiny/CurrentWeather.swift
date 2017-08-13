//
//  CurrentWeather.swift
//  rainyshiny
//
//  Created by Julian Bergmann on 08.08.17.
//  Copyright © 2017 Julian Bergmann. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
  var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
   var weatherType: String {
        if _weatherType == nil || _weatherType == "Mist" {
            _weatherType = ""
        }
        return _weatherType
    }
    
   var currentTemp: Double  {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }  
        return _currentTemp
    }
    

    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        // Alamofire download
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            //print(response)
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
     
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        
                        let kelvinToCentigrade = currentTemperature - 273.15
                        let roundedCurrentTemp = Double(round(100*kelvinToCentigrade/100))
                        self._currentTemp = roundedCurrentTemp
                        print(self._currentTemp)
                    }
                }
            }
        
        completed() 
    
        }
        }
    

    
}
