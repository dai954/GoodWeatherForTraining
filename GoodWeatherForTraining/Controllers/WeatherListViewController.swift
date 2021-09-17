//
//  WeatherListViewController.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/08/17.
//

import UIKit

class WeatherListViewController: UIViewController, UITableViewDelegate, AddWeatherDelegate {
    
    let cellIdentifier: String = "WetherCell"
    let tableView = UITableView()
    private var weatherListViewModel = WeatherListViewModel()
    private var datasource: TableViewDataSource<WeatherCell, WeatherViewModel>!
    private var lastUnitSelection: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datasource = TableViewDataSource(cellIdentifier: cellIdentifier, items: self.weatherListViewModel.weatherViewModels, configureCell: { cell , vm in
            cell.cityNameLavel.text = vm.city
            cell.temperatureLavel.text = vm.temperature.formatAsDegree()
        })
        
        tableView.delegate = self
        tableView.dataSource = datasource
        
        view.addSubview(tableView)
        tableView.fillSuperview()
        setupNav()
        tableView.register(WeatherCell.self, forCellReuseIdentifier: cellIdentifier)
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
        
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        datasource.updateItems(weatherListViewModel.weatherViewModels)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableview selected")
        let weatherDetailsVC = WeatherDetailsViewController()
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        weatherDetailsVC.weatherViewModel = weatherVM
        self.navigationController?.pushViewController(weatherDetailsVC, animated: true)
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


extension WeatherListViewController: SettingDelegate {
    func settingDone(vm: SettingViewModel) {
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)!
        }
    }
    
    
}
