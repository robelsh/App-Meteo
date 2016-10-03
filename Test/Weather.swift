//
//  Weather.swift
//  Test
//
//  Created by Etienne Jézéquel on 03/10/2016.
//  Copyright © 2016 Etienne Jézéquel. All rights reserved.
//

import Foundation

struct Weather {
    let cityName: String
    let temp: Double
    let desc: String
    let lat: Double
    let lon: Double
    
    init(cityName: String, temp: Double, desc: String, lon: Double, lat: Double) {
        self.cityName = cityName
        self.temp = temp
        self.desc = desc
        self.lat = lat
        self.lon = lon
    }
}
