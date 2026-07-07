//
//  NewReceiptView.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 05/07/26.
//

import UIKit

class NewReceiptView: UIView {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = .white
        
        self.addSubview(backButton)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(addButton)
        self.addSubview(remedyInput)
        self.addSubview(timeInput)
        self.addSubview(recurrencyInput)
        self.addSubview(checkbox)
        
        setupConstrains()
    }
    
    let backButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)
        button.setImage(UIImage(systemName: "arrow.left", withConfiguration: config), for: .normal)
        button.tintColor = Colors.gray100
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.heading
        label.textColor = Colors.primaryRedBase
        label.text = "New Receipt"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.text = "Add your prescription to receive reminders to take your medication"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let remedyInput = Input(title: "Medication", placeholder: "Medication name")
    let timeInput = Input(title: "Time", placeholder: "12:00")
    let recurrencyInput = Input(title: "Recurrency", placeholder: "Select")
    let checkbox = Checkbox(title: "Take now")
    
    private lazy var addButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "plus")
        config.imagePlacement = .leading
        config.imagePadding = Metrics.space12
        config.baseBackgroundColor = Colors.gray100
        config.baseForegroundColor = Colors.white
        config.title = "receipts.addButton.title".localized
        config.cornerStyle = .capsule
        
        config.titleTextAttributesTransformer = .init { incoming in
            var outgoing = incoming
            outgoing.font = Typography.subHeading
            return outgoing
        }
        
        let button = UIButton(configuration: config)
        button.heightAnchor.constraint(equalToConstant: Metrics.buttonSize).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        return button
    }()
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.space32),
            backButton.heightAnchor.constraint(equalToConstant: Metrics.space24),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.space24),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Metrics.space32),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: Metrics.space32),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.space10),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Metrics.space32),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: Metrics.space32),
            
            remedyInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.space40),
            remedyInput.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Metrics.space32),
            remedyInput.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Metrics.space32),
            
            timeInput.topAnchor.constraint(equalTo: remedyInput.bottomAnchor, constant: Metrics.space20),
            timeInput.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Metrics.space32),
            timeInput.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Metrics.space32),
            
            recurrencyInput.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: Metrics.space20),
            recurrencyInput.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Metrics.space32),
            recurrencyInput.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Metrics.space32),
            
            checkbox.topAnchor.constraint(equalTo: recurrencyInput.bottomAnchor, constant: Metrics.space20),
            checkbox.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Metrics.space32),
            checkbox.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Metrics.space32),
            
            addButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.space12),
            addButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Metrics.space32),
            addButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Metrics.space32),
        ])
    }
    
    @objc
    private func didTapAdd() {}
}
