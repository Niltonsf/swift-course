//
//  Checkbox.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 06/07/26.
//

import UIKit

public class Checkbox: UIView {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = title
                
        setupView()
    }
    
    private func setupView() {
        self.addSubview(titleLabel)
        self.addSubview(checkboxButton)
        
        setupConstrains()
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.label
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkboxButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.tintColor = Colors.gray400
        button.addTarget(Checkbox.self, action: #selector(toggle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            checkboxButton.topAnchor.constraint(equalTo: self.topAnchor),
            checkboxButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            checkboxButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkboxButton.heightAnchor.constraint(equalToConstant: 24),
            checkboxButton.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: checkboxButton.trailingAnchor, constant: Metrics.space12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    @objc
    func toggle() {
        return checkboxButton.isSelected.toggle()
    }
}
