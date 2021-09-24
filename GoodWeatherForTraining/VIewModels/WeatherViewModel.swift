//
//  WeatherViewModel.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/09/24.
//

import Foundation

class WeatherListViewModel {

    var weathers = [WeatherViewModel]()
    
    func addWeather(vm: WeatherViewModel) {
        weathers.append(vm)
    }
    
    func weatherAt(index: Int) -> WeatherViewModel {
        return weathers[index]
    }
    
    private func toCelsius() {
        
        weathers = weathers.map({ weather in
            weather.temperature = (weather.temperature - 32) * 5/9
            return weather
        })
        
    }
    
    private func toFarenheit() {
        weathers = weathers.map({ weather in
            weather.temperature = (weather.temperature * 9/5) + 32
            return weather
        })
    }
    
    func changeTemp(unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .farenheit:
            toFarenheit()
        }
    }
    
}


class WeatherViewModel {

    let weather: WeatherResponse
    
    var temperature: Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var name: String {
        return weather.name
    }
    
    var humidity: Double {
        return weather.main.humidity
    }
}
