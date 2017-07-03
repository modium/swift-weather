//
//  CurrentWeather.swift
//  Swift_Weather
//
//  Created by Jaf Crisologo on 2017-07-03.
//  Copyright © 2017 Modium Design. All rights reserved.
//

import Foundation

class CurrentWeather {
    // optionals are used because they may be nil
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
    }
    
    init(weatherDictionary: [String : Any]) {
        temperature = weatherDictionary[WeatherKeys.temperature] as? Int
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double {
            humidity = Int(humidityDouble * 100)
        } else {
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double {
            precipProbability = Int(precipDouble * 100)
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
    }
    
    /*
     "time": 1499118813,
     "summary": "Clear",
     "icon": "clear-day",
     "nearestStormDistance": 418,
     "nearestStormBearing": 0,
     "precipIntensity": 0,
     "precipProbability": 0,
     "temperature": 64.54,
     "apparentTemperature": 64.54,
     "dewPoint": 53.1,
     "humidity": 0.66,
     "windSpeed": 9.32,
     "windGust": 15.22,
     "windBearing": 234,
     "visibility": 10,
     "cloudCover": 0.17,
     "pressure": 1015.56,
     "ozone": 301.76,
     "uvIndex": 8
    */
}
