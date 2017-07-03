//
//  CurrentWeatherViewController.swift
//  Swift_Weather
//
//  Created by Jaf Crisologo on 2017-07-03.
//  Copyright © 2017 Modium Design. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var unitLbl: UILabel!
    @IBOutlet weak var bgImg: UIImageView!
    var celsius: Double = 0.0

    // Testing data
    let forecastAPIKey = "85cccc9d2ed22dc93ce90ae4630fe4fa"
    let coordinate: (lat: Double, long: Double) = (51.0486,114.0708)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
            // This is happening async from the main queue
            if let currentWeather = currentWeather {
                // ALL UI CODE MUST BE ON THE MAIN QUEUE
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature {
                        self.convertToCelsius(temp: Double(temperature))
                        self.temperatureLbl.text = "\(Int(self.celsius))"
                    } else {
                        self.temperatureLbl.text = "-"
                    }
                }
            }
        }
        
    }
    
    func convertToCelsius(temp: Double) {
        celsius = (temp - 32) * (5/9)
    }
}
