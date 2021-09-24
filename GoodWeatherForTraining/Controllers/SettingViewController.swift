//
//  SettingViewController.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/08/17.
//

import UIKit

protocol SettingDoneDelegate {
    func settingDone(vm: SettingViewModel)
}

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    private let tableView = UITableView()
    
    var settingVM = SettingViewModel()
    
    var delegate: SettingDoneDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Setting"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.fillSuperview()
        
    }
    
    @objc private func doneTapped() {
        print("doneTapped")
        delegate?.settingDone(vm: settingVM)
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        settingVM.selectedUnit = settingVM.units[indexPath.row]
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.accessoryType = .none
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingVM.units.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        
        let settingUnit = settingVM.units[indexPath.row]
        
        if settingVM.selectedUnit == settingUnit {
            cell.accessoryType = .checkmark
        }
        
        cell.textLabel?.text = settingUnit.displayName
        return cell
    }
}
