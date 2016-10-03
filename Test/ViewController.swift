//
//  ViewController.swift
//  Test
//
//  Created by Etienne Jézéquel on 03/10/2016.
//  Copyright © 2016 Etienne Jézéquel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {

    var weatherService = WeatherService()
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBAction func setCityTapped(_ sender: UIButton) {
        openCityAlert()
    }
    
    
    func openCityAlert() {
        //Create Alert COntroller
        let alert = UIAlertController(title: "City",
                                      message: "Enter city name",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        //Create Cancel Action
        let cancel = UIAlertAction(title: "Cancel",
                                   style: UIAlertActionStyle.cancel,
                                   handler: nil)
        
        alert.addAction(cancel)

        //Create OK Action
        let ok = UIAlertAction(title: "OK",
                               style: UIAlertActionStyle.default) { (action: UIAlertAction) in
                                let textField = alert.textFields?[0]
                                let cityName = textField?.text
                                self.weatherService.getWeatherForCity(city: cityName!)
        }
        
        //Add Text field
        alert.addTextField { (textField: UITextField) in
            textField.placeholder = "City Name"
        }
        
        alert.addAction(ok)

        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    func setWeather(weather: Weather) {
        self.cityLabel.text = weather.cityName
        self.descLabel.text = weather.desc
        self.tempLabel.text = String(format:"%f", weather.temp)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.weatherService.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

