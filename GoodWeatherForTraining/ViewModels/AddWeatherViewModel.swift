//
//  AddWeatherViewModel.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/08/28.
//

import Foundation

struct AddWeatherViewModel {
    
    var city = ""
    var state = ""
    var zipCode = ""
    
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        
        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        
        WebService().load(resource: weatherResource) { result in
            if let weatherResource = result {
                let vm = WeatherViewModel(weather: weatherResource)
                completion(vm)
            }
        }
    }
}
