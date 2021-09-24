//
//  WeatherListViewController.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/08/17.
//

import UIKit

class WeatherListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddWeatherDelegate {
    private let cellId = "cellId"
    let tableView = UITableView()
    
    let weatherListVM = WeatherListViewModel()
    
    var lastUnitSelection: Unit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(WeatherCell.self, forCellReuseIdentifier: cellId)
        
        if let settingUnit = UserDefaults.standard.string(forKey: "unit") {
            lastUnitSelection = Unit(rawValue: settingUnit)
        }
        
        view.addSubview(tableView)
        tableView.fillSuperview()
        setupNav()
        
    }
    
    func addWeather(vm: WeatherViewModel) {
        weatherListVM.addWeather(vm: vm)
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListVM.weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WeatherCell
        let weatherVM = weatherListVM.weatherAt(index: indexPath.row)
        
        cell.cityNameLavel.text = weatherVM.name
        cell.temperatureLavel.text = weatherVM.temperature.formatAsDegree()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func setupNav() {
        
        navigationItem.title = "weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Setting", style: .plain, target: self, action: #selector(settingTapped))
    }
    
    @objc func addTapped() {
        let addWeatherCityVC = AddWeatherCityViewController()
        addWeatherCityVC.delegate = self
        let nav = UINavigationController(rootViewController: addWeatherCityVC)
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc func settingTapped() {
        let settingVC = SettingViewController()
        settingVC.delegate = self
        let nav = UINavigationController(rootViewController: settingVC)
        self.present(nav, animated: true, completion: nil)
    }
}

extension WeatherListViewController: SettingDoneDelegate {
    func settingDone(vm: SettingViewModel) {
        
        if vm.selectedUnit != lastUnitSelection {
            weatherListVM.changeTemp(unit: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = vm.selectedUnit
        }
    }
}
