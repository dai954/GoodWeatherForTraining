//
//  WeatherDataSource.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/09/04.
//

import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    let cellIdentifier: String
    private var weatherListViewModel: WeatherListViewModel
    
    init(_ weatherListViewModel: WeatherListViewModel, cellIdentifier: String) {
        self.weatherListViewModel = weatherListViewModel
        self.cellIdentifier = cellIdentifier
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("not found WeatherCell")
        }
        
        let weaatherVM = weatherListViewModel.modelAt(indexPath.row)
        cell.cityNameLavel.text = weaatherVM.city
        cell.temperatureLavel.text = weaatherVM.temperature.formatAsDegree()
        
        return cell
    }
    
    
}
