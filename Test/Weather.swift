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
    
    init(cityName: String, temp: Double, desc: String) {
        self.cityName = cityName
        self.temp = temp
        self.desc = desc
    }
}
