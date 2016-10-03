//
//  WeatherService.swift
//  Test
//
//  Created by Etienne Jézéquel on 03/10/2016.
//  Copyright © 2016 Etienne Jézéquel. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
    
    
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeatherForCity(city : String){
        let path = "http://api.openweathermap.org/data/2.5/weather?q=paris&APPID=85bfe217fd2ec11a64c748d4e392b871"
        let url = URL(string: path)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            print(data)
        }
        
        task.resume()
        
        //Request weather data
        //Wait ...
        //Process Data
        
        /*
         et weather = Weather(cityName: city, temp: 237.12, desc: "a nice day")
        
        if delegate != nil {
            delegate?.setWeather(weather: weather)
        }
         */
    }
}
