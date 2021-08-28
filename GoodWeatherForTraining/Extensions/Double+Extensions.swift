//
//  Double+Extensions.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/08/28.
//

import Foundation

extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f˚", self)
    }
}

