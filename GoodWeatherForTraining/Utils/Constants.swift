//
//  Constants.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/09/24.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeahterByCity(city: String) -> URL {
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"

            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=3f63ffa4cdd77e0e1bde5ffcba9e32ae&units=\(unit)")!
        }
        
    }
    
}
