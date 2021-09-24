//
//  AddWeatherViewModel.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/09/24.
//

import Foundation

struct AddWeatheerViewModel {

    func addWeatherVM(city: String, completion: @escaping (WeatherViewModel) -> ()) {
        let url = Constants.Urls.urlForWeahterByCity(city: city)
        
        let resource = Resource<WeatherResponse>(url: url) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
            
        WebService().load(resource: resource) { result in
            if let weatherResource = result {
                let weatherVM = WeatherViewModel(weather: weatherResource)
                completion(weatherVM)
            }
        }
            
        }
        
    }
