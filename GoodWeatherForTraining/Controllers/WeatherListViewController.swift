//
//  WeatherListViewController.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/08/17.
//

import UIKit

class WeatherListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let cellId = "cellId"
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(WeatherCell.self, forCellReuseIdentifier: cellId)
        
        view.addSubview(tableView)
        tableView.fillSuperview()
        setupNav()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WeatherCell
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
        let nav = UINavigationController(rootViewController: addWeatherCityVC)
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc func settingTapped() {
        let settingVC = SettingViewController()
        let nav = UINavigationController(rootViewController: settingVC)
        self.present(nav, animated: true, completion: nil)
    }
}
