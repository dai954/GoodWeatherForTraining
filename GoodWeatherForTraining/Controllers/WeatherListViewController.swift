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
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(WeatherCell.self, forCellReuseIdentifier: cellId)
        
        view.addSubview(tableView)
        tableView.fillSuperview()
        setupNav()
        
        let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Houston&appid=3f63ffa4cdd77e0e1bde5ffcba9e32ae&units=imperial")!
        let weatherResource = Resource<WeatherResponse>(url: weatherUrl) { data in
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
        }
        
        WebService().load(resource: weatherResource) { weatherResponse in
            if let weatherResponse = weatherResponse {
                print(weatherResponse)
            }
        }
        
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numverOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WeatherCell
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        
        cell.configure(weatherVM)
        
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
        let nav = UINavigationController(rootViewController: settingVC)
        self.present(nav, animated: true, completion: nil)
    }
}
