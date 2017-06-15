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
        
        // Initialize properties
        self.city = name
        self.condition = text
        self.degree = temp
        self.imgURL = "http:\(icon)"
    }
}
