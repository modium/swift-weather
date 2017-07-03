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
}
