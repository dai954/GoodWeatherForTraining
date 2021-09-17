//
//  WeatherDetailsViewController.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/09/04.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    
    var weatherViewModel: WeatherViewModel?
    
    let cityNameLabel: UILabel = {
       let label = UILabel()
        label.text = "label"
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
       return label
    }()
    
    let currentTemperatureLabel: UILabel = {
       let label = UILabel()
        label.text = "label"
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
       return label
    }()
    
    let maxTempLabel: UILabel = {
       let label = UILabel()
        label.text = "label"
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
       return label
    }()
    
    let minTempLabel: UILabel = {
       let label = UILabel()
        label.text = "label"
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
       return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(cityNameLabel)
        view.addSubview(currentTemperatureLabel)
        view.addSubview(maxTempLabel)
        view.addSubview(minTempLabel)
        
        cityNameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 30, bottom: 0, right: 30))
        currentTemperatureLabel.anchor(top: cityNameLabel.bottomAnchor, leading: cityNameLabel.leadingAnchor, bottom: nil, trailing: cityNameLabel.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        maxTempLabel.anchor(top: currentTemperatureLabel.bottomAnchor, leading: currentTemperatureLabel.leadingAnchor, bottom: nil, trailing: currentTemperatureLabel.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        minTempLabel.anchor(top: maxTempLabel.bottomAnchor, leading: maxTempLabel.leadingAnchor, bottom: nil, trailing: maxTempLabel.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        populateText()
    }
    
    private func populateText() {
        if let weatherViewModel = weatherViewModel {
            cityNameLabel.text = weatherViewModel.city
            currentTemperatureLabel.text = weatherViewModel.temperature.formatAsDegree()
        }
    }
    
}
