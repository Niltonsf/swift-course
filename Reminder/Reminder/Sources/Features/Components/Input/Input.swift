//
//  Input.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 05/07/26.
//

import UIKit

public class Input: UIView {
    init(title: String, placeholder: String){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = title
        textField.placeholder = placeholder        
        
        configurePlaceholder(placeholder: placeholder)
        setupView()
    }
    
    private func configurePlaceholder(placeholder: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: Colors.gray200])
    }
    
    private func setupView() {
        self.addSubview(titleLabel)
        self.addSubview(textField)
        
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.label
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let uITextField = UITextField()
        uITextField.font = Typography.input
        uITextField.textColor = Colors.gray100
        uITextField.borderStyle = .none
        uITextField.backgroundColor = .white
        uITextField.layer.borderWidth = 1
        uITextField.layer.borderColor = Colors.gray400.cgColor
        uITextField.layer.cornerRadius = 8

        let padding = UIView(frame: CGRect(x: 0, y: 0, width: Metrics.inputInnerHorizontalPadding, height: Metrics.inputSize))
        uITextField.leftView = padding
        uITextField.leftViewMode = .always
        uITextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: Metrics.inputInnerHorizontalPadding, height: Metrics.inputSize))
        uITextField.rightViewMode = .always

        uITextField.translatesAutoresizingMaskIntoConstraints = false
        return uITextField
    }()
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 85),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.space12),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
    func getText() -> String {
        return textField.text ?? ""
    }
}
