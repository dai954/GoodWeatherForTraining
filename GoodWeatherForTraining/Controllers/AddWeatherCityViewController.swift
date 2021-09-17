//
//  AddWeatherCityViewController.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/08/17.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    private var addWeatherVM = AddWeatherViewModel()
    var delegate: AddWeatherDelegate?
    
    let cityNameField: BindingTextField = {
        let textField = BindingTextField()
        textField.backgroundColor = .white
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    let stateNameField: BindingTextField = {
        let textField = BindingTextField()
        textField.backgroundColor = .white
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    let zipCodeField: BindingTextField = {
        let textField = BindingTextField()
        textField.backgroundColor = .white
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    let cityButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Add City"
        
        cityNameField.bind { self.addWeatherVM.city = $0 }
        stateNameField.bind { self.addWeatherVM.state = $0 }
        zipCodeField.bind { self.addWeatherVM.zipCode = $0 }
        
        view.addSubview(cityNameField)
        view.addSubview(stateNameField)
        view.addSubview(zipCodeField)
        view.addSubview(cityButton)
        
        cityButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        cityNameField.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 50, bottom: 0, right: 50))
        stateNameField.anchor(top: cityNameField.bottomAnchor, leading: cityNameField.leadingAnchor, bottom: nil, trailing: cityNameField.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        zipCodeField.anchor(top: stateNameField.bottomAnchor, leading: stateNameField.leadingAnchor, bottom: nil, trailing: stateNameField.trailingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        cityButton.anchor(top: zipCodeField.bottomAnchor, leading: zipCodeField.leadingAnchor, bottom: nil, trailing: zipCodeField.trailingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        setup()
        
    }
    
    
    @objc func buttonPressed() {
        print(self.addWeatherVM)
        
        if let city = cityNameField.text {
            
            addWeatherVM.addWeather(for: city) { vm in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
            
            }
            
        }
    
    private func setup() {
        
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closedTapped))
    }
    
    @objc private func closedTapped() {
        dismiss(animated: true, completion: nil)
    }
}
