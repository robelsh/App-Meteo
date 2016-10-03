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
        let apiKey = "85bfe217fd2ec11a64c748d4e392b871"
        let cityEscaped = city.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped!)&APPID=\(apiKey)"
        let url = URL(string: path)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            let json = JSON(data: data!)
            let lon = json["coord"]["lon"].double
            let lat = json["coord"]["lat"].double
            let temp = json["main"]["temp"].double
            let name = json["name"].string
            let desc = json["weather"][0]["description"].string
            
            let weather = Weather(cityName: name!, temp: temp!, desc: desc!)

            if self.delegate != nil {
                DispatchQueue.main.async {
                    self.delegate?.setWeather(weather: weather)
                }
            }
            
            print(lat,lon)
        }
        
        task.resume()
    }
}
