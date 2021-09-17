//
//  BindingTextField.swift
//  GoodWeatherForTraining
//
//  Created by 石川大輔 on 2021/09/04.
//

import UIKit

class BindingTextField: UITextField {
    
    var textChangeClosure: (String) -> () = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func bind(callback: @escaping (String) -> ()) {
        textChangeClosure = callback
    }
    
    private func commonInit() {
        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    @objc private func textFieldChange(_ textField: UITextField) {
        if let text = textField.text {
            textChangeClosure(text)
        }
    }
}
