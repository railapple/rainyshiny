//
//  WeatherCell.swift
//  rainyshiny
//
//  Created by Julian Bergmann on 12.08.17.
//  Copyright © 2017 Julian Bergmann. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

 
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    
    override func awakeFromNib() {
        
    }
    
        
        func configureCell(forecast: Forecast) {
            
            lowTemp.text = "\(forecast.lowTemp)°"
            highTemp.text = "\(forecast.highTemp)°"
            weatherType.text = forecast.weatherType
            dayLbl.text = forecast.date
            weatherIcon.image = UIImage(named: forecast.weatherType)
            
            
        }
        
    }


