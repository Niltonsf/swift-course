//
//  HomeViewCard.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 04/07/26.
//

import UIKit

class HomeViewCard: UIView {
    init(icon: UIImage?, title: String, description: String){
        super.init(frame: .zero)
        
        cardIconContainerImage.image = icon
        cardTitle.text = title
        cardDescription.text = description
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.layer.cornerRadius = Metrics.space12
        self.layer.borderWidth = 1
        self.layer.borderColor = Colors.gray600.cgColor
        self.backgroundColor = Colors.gray700
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layoutMargins = UIEdgeInsets(top: Metrics.space12, left: Metrics.space12, bottom: Metrics.space12, right: Metrics.space12)
        
        self.addSubview(cardIconContainer)
        self.addSubview(cardTitle)
        self.addSubview(chevronRight)
        self.addSubview(cardDescription)
        cardIconContainer.addSubview(cardIconContainerImage)
        
        setupConstrains()
    }
    
    private let cardIconContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray600
        view.layer.cornerRadius = Metrics.space8
        view.layoutMargins = UIEdgeInsets(top: Metrics.space20, left: Metrics.space12, bottom: Metrics.space20, right: Metrics.space12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let cardIconContainerImage: UIImageView = {
        let uiImageView = UIImageView()
        let imageSize = 48.0
        uiImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        uiImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        uiImageView.contentMode = .scaleAspectFit
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        return uiImageView
    }()
    
    private let cardTitle: UILabel = {
        let label = UILabel()
        label.font = Typography.subHeading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var chevronRight: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .semibold)
        imageView.image = UIImage(systemName: "chevron.right", withConfiguration: config)
        imageView.tintColor = Colors.gray400
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let cardDescription: UILabel = {
        let label = UILabel()        
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([            
            cardIconContainer.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            cardIconContainer.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            cardIconContainer.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            
            cardIconContainerImage.topAnchor.constraint(equalTo: cardIconContainer.layoutMarginsGuide.topAnchor),
            cardIconContainerImage.leadingAnchor.constraint(equalTo: cardIconContainer.layoutMarginsGuide.leadingAnchor),
            cardIconContainerImage.trailingAnchor.constraint(equalTo: cardIconContainer.layoutMarginsGuide.trailingAnchor),
            cardIconContainerImage.bottomAnchor.constraint(equalTo: cardIconContainer.layoutMarginsGuide.bottomAnchor),
            
            cardTitle.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: Metrics.space10),
            cardTitle.leadingAnchor.constraint(equalTo: cardIconContainer.trailingAnchor, constant: Metrics.space16),
            
            chevronRight.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: Metrics.space10),
            chevronRight.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
                        
            cardDescription.topAnchor.constraint(equalTo: cardTitle.topAnchor, constant: Metrics.space12),
            cardDescription.leadingAnchor.constraint(equalTo: cardIconContainer.trailingAnchor, constant: Metrics.space16),
            cardDescription.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            cardDescription.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: Metrics.space4),
        ])
    }
}
