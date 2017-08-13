//
//  Forecast.swift
//  rainyshiny
//
//  Created by Julian Bergmann on 09.08.17.
//  Copyright © 2017 Julian Bergmann. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    var weatherType: String {
        if _weatherType == nil || _weatherType == "Mist" {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
           
            if let min = temp["min"] as? Double {
                
                let kelvinToCentigrade = min - 273.15
                let roundedLowTemp = Double(round(100*kelvinToCentigrade)/100)
                self._lowTemp = "\(roundedLowTemp)"
                print(self._lowTemp)
            }
            
            if let max = temp["max"] as? Double {
                let kelvinToCentigrade = max - 273.15
                let roundedHighTemp = Double(round(100*kelvinToCentigrade)/100)
                self._highTemp = "\(roundedHighTemp)"
                print(self._highTemp)
            }
            
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
                print(self._weatherType)
            }
        }
        
        if let date = weatherDict["dt"] as? String {
           
            let unixConvertedDate = Date(timeIntervalSince1970: Double(date)!)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
                       
            self._date = unixConvertedDate.dayOfTheWeek()
            print(self._date)
        }
        
        
    }
}

extension Date {
    func dayOfTheWeek() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}



