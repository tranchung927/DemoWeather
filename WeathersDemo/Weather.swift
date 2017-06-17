//
//  Weather.swift
//  WeathersDemo
//
//  Created by Tran Chung on 6/14/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import Foundation

typealias JSON = Dictionary<AnyHashable,Any>

struct Weather {
        var degree: Double
        var condition: String
        var imgURL: String
        var city: String
        var weatherObjectarray: [WeatherOBject] = []
    
    init?(json: JSON) {
        guard let location = json["location"] as? JSON,
            let name = location["name"] as? String
            else {
                return nil
        }
        guard let current = json["current"] as? JSON,
            let temp = current["temp_c"] as? Double
            else {
                return nil
        }
        guard let condition = current["condition"] as? JSON,
            let text = condition["text"] as? String,
            let icon = condition["icon"] as? String
            else {
                return nil
        }
        
        guard let forecast = json["forecast"] as? JSON,
            let forecastday = forecast["forecastday"] as? [JSON]
            else {
            return nil
        }
        for item_L in forecastday {
            let hour = item_L["hour"] as! [JSON]
            for item in hour {
                let time_Hour = item["time"] as? String
                let tempC_Hour = item["temp_c"] as? Double
                let condition_Hour = item["condition"] as? JSON
                let text_Hour = condition_Hour?["text"] as? String
                let icon_Hour = condition_Hour?["icon"] as? String
                let weatherObject = WeatherOBject(timeHour: time_Hour!, tempCHour: tempC_Hour!, textHour: text_Hour!, iconHour: "http:\(icon_Hour!)")
                weatherObjectarray.append(weatherObject)
            }
        }
        
        
        // Initialize properties
        self.city = name
        self.condition = text
        self.degree = temp
        self.imgURL = "http:\(icon)"
    }
}

struct WeatherOBject {
    var timeHour: String
    var tempCHour: Double
    var textHour: String
    var iconHour: String
}
