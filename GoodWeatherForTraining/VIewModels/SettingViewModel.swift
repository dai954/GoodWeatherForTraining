//
//  SettingViewModel.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/09/24.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case farenheit = "imperial"
    
    var displayName: String {
        switch self {
        case .celsius:
           return "Celsius"
        case .farenheit:
           return "Farenheit"
        }
    }
}

struct SettingViewModel {
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
            guard let unitValue = UserDefaults.standard.string(forKey: "unit") else {
                fatalError("faild to get unit")
            }
            return Unit(rawValue: unitValue) ?? .farenheit
        }
        
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "unit")
        }
    }
    
}
