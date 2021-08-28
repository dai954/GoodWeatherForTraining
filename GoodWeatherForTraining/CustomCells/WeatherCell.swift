//
//  WeatherCell.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/08/17.
//

import Foundation

import UIKit

class WeatherCell: UITableViewCell {
    
    let cityNameLavel: UILabel = {
        let label = UILabel()
        label.text = "osaka"
        return label
    }()
    
    let temperatureLavel: UILabel = {
        let label = UILabel()
        label.text = "30°"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cityNameLavel)
        addSubview(temperatureLavel)
        
        cityNameLavel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        temperatureLavel.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
    }
    
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLavel.text = vm.city
        self.temperatureLavel.text = "\(vm.temperature.formatAsDegree())"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
