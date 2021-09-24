//
//  Double+Extensions.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/09/24.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f", self)
    }
    
}
