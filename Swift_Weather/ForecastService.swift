//
//  ForecastService.swift
//  Swift_Weather
//
//  Created by Jaf Crisologo on 2017-07-03.
//  Copyright © 2017 Modium Design. All rights reserved.
//

import Foundation

class ForecastService {
    
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String) {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getForecast(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void) {
//        if let forecastURL = URL(string: "\(latitude),\(longitude)", relativeTo: forecastBaseURL!) {
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)") {
            let networkProcessor = NetworkProcessor(url: forecastURL)
            networkProcessor.downloadJSONFromURL({ (jsonDictionary) in
                // Parse jsonDictionary into a CurrentWeather object
                if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String : Any] {
                    let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                    completion(currentWeather)
                } else {
                    completion(nil)
                }
            })
        }
    }
    
}
