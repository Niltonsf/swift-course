//
//  HomeView.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 29/06/26.
//

import Foundation
import UIKit

class HomeView: UIView {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }    
    
    private func setup() {
        self.backgroundColor = Colors.gray600
                
        self.addSubview(headerProfileArea)
        self.addSubview(headerProfileImage)
        self.addSubview(headerSignOutIconButton)
        self.addSubview(headerWelcomeText)
        self.addSubview(headerUserNameText)
        
        self.addSubview(contentArea)
        contentArea.addSubview(contentAreaCard)
        contentArea.addSubview(reviewButton)
        contentAreaCard.addSubview(contentAreaCardIconContainer)
        contentAreaCard.addSubview(contentAreaCardTitle)
        contentAreaCard.addSubview(contentAreaCardChevronRight)
        contentAreaCard.addSubview(contentAreaCardDescription)
        contentAreaCardIconContainer.addSubview(contentAreaCardIconContainerImage)
        
        setupConstrains()
    }
    
    private let headerProfileArea: UIView = {
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerProfileImage: UIImageView = {
        let uiImageView = UIImageView()
        let imageSize = 64.0
        uiImageView.image = UIImage(named: "me")
        uiImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        uiImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        uiImageView.layer.cornerRadius = imageSize / 2
        uiImageView.layer.borderWidth = 1.5
        uiImageView.layer.borderColor = Colors.primaryBlueBase.cgColor
        uiImageView.contentMode = .scaleAspectFit
        uiImageView.clipsToBounds = true
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        return uiImageView
    }()
    
    private lazy var headerSignOutIconButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "rectangle.portrait.and.arrow.right")
        config.baseBackgroundColor = .label
        config.baseForegroundColor = .red
        config.contentInsets = .zero
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapLogOut), for: .touchUpInside)
        return button
    }()
    
    private let headerWelcomeText: UILabel = {
        let label = UILabel()
        label.text = "home.welcome".localized
        label.font = Typography.input
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let headerUserNameText: UILabel = {
        let label = UILabel()
        label.text = "Nilton Schumacher"
        label.font = Typography.heading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let contentArea: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Metrics.space24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = UIEdgeInsets(top: Metrics.space24, left: Metrics.space24, bottom: Metrics.space24, right: Metrics.space24)
        return view
    }()
    
    private let contentAreaCard: UIControl = {
        let uiControl = UIControl()
        uiControl.layer.cornerRadius = Metrics.space12
        uiControl.layer.borderWidth = 1
        uiControl.layer.borderColor = Colors.gray600.cgColor
        uiControl.backgroundColor = Colors.gray700
        uiControl.translatesAutoresizingMaskIntoConstraints = false
        uiControl.layoutMargins = UIEdgeInsets(top: Metrics.space12, left: Metrics.space12, bottom: Metrics.space12, right: Metrics.space12)
        return uiControl
    }()
    
    private let contentAreaCardIconContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray600
        view.layer.cornerRadius = Metrics.space8
        view.layoutMargins = UIEdgeInsets(top: Metrics.space20, left: Metrics.space12, bottom: Metrics.space20, right: Metrics.space12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let contentAreaCardIconContainerImage: UIImageView = {
        let uiImageView = UIImageView()
        let imageSize = 48.0
        uiImageView.image = UIImage(named: "paper")
        uiImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        uiImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        uiImageView.contentMode = .scaleAspectFit
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        return uiImageView
    }()
    
    private let contentAreaCardTitle: UILabel = {
        let label = UILabel()
        // TODO: THIS WILL BE PARAMS THAT'S WHY WE DON'T DECALRE IN LOCALIZABLE
        label.text = "My receits"
        label.font = Typography.subHeading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var contentAreaCardChevronRight: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .semibold)
        imageView.image = UIImage(systemName: "chevron.right", withConfiguration: config)
        imageView.tintColor = Colors.gray400
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let contentAreaCardDescription: UILabel = {
        let label = UILabel()
        // TODO: THIS WILL BE PARAMS THAT'S WHY WE DON'T DECALRE IN LOCALIZABLE
        label.text = "Acompanhe os medicamentos e gerencie lembretes"
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var reviewButton: UIButton = {
        var config = UIButton.Configuration.filled()        
        config.image = UIImage(systemName: "star")
        config.imagePlacement = .leading
        config.imagePadding = Metrics.space12
        config.baseBackgroundColor = Colors.gray100
        config.baseForegroundColor = Colors.white
        config.title = "home.reviewButton.title".localized
        config.cornerStyle = .capsule
        
        config.titleTextAttributesTransformer = .init { incoming in
            var outgoing = incoming
            outgoing.font = Typography.subHeading
            return outgoing
        }
        
        let button = UIButton(configuration: config)
        button.heightAnchor.constraint(equalToConstant: Metrics.buttonSize).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapReviewButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func didTapLogOut() {
        print("Tapped logout")
    }
    
    @objc
    private func didTapReviewButton() {
        print("Tapped review")
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            headerProfileArea.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Metrics.space32),
            headerProfileArea.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.space32),
            headerProfileArea.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.space32),
            headerProfileArea.bottomAnchor.constraint(equalTo: contentArea.topAnchor, constant: -Metrics.space32),
            
            headerProfileImage.topAnchor.constraint(equalTo: headerProfileArea.topAnchor),
            headerProfileImage.leadingAnchor.constraint(equalTo: headerProfileArea.leadingAnchor),
            
            headerSignOutIconButton.topAnchor.constraint(equalTo: headerProfileArea.topAnchor),
            headerSignOutIconButton.trailingAnchor.constraint(equalTo: headerProfileArea.trailingAnchor),
            
            headerWelcomeText.topAnchor.constraint(equalTo: headerProfileImage.bottomAnchor, constant: Metrics.space16),
            headerWelcomeText.leadingAnchor.constraint(equalTo: headerProfileArea.leadingAnchor),
            
            headerUserNameText.topAnchor.constraint(equalTo: headerWelcomeText.bottomAnchor, constant: Metrics.space4),
            headerUserNameText.leadingAnchor.constraint(equalTo: headerProfileArea.leadingAnchor),
            
            contentArea.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentArea.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentArea.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentArea.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            
            contentAreaCard.topAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.topAnchor),
            contentAreaCard.leadingAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.leadingAnchor),
            contentAreaCard.trailingAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.trailingAnchor),
            
            contentAreaCardIconContainer.topAnchor.constraint(equalTo: contentAreaCard.layoutMarginsGuide.topAnchor),
            contentAreaCardIconContainer.leadingAnchor.constraint(equalTo: contentAreaCard.layoutMarginsGuide.leadingAnchor),
            contentAreaCardIconContainer.bottomAnchor.constraint(equalTo: contentAreaCard.layoutMarginsGuide.bottomAnchor),
            
            contentAreaCardIconContainerImage.topAnchor.constraint(equalTo: contentAreaCardIconContainer.layoutMarginsGuide.topAnchor),
            contentAreaCardIconContainerImage.leadingAnchor.constraint(equalTo: contentAreaCardIconContainer.layoutMarginsGuide.leadingAnchor),
            contentAreaCardIconContainerImage.trailingAnchor.constraint(equalTo: contentAreaCardIconContainer.layoutMarginsGuide.trailingAnchor),
            contentAreaCardIconContainerImage.bottomAnchor.constraint(equalTo: contentAreaCardIconContainer.layoutMarginsGuide.bottomAnchor),
            
            contentAreaCardTitle.topAnchor.constraint(equalTo: contentAreaCard.layoutMarginsGuide.topAnchor, constant: Metrics.space10),
            contentAreaCardTitle.leadingAnchor.constraint(equalTo: contentAreaCardIconContainer.trailingAnchor, constant: Metrics.space16),
            
            contentAreaCardChevronRight.topAnchor.constraint(equalTo: contentAreaCard.layoutMarginsGuide.topAnchor, constant: Metrics.space10),
            contentAreaCardChevronRight.trailingAnchor.constraint(equalTo: contentAreaCard.layoutMarginsGuide.trailingAnchor),
                        
            contentAreaCardDescription.topAnchor.constraint(equalTo: contentAreaCardTitle.topAnchor, constant: Metrics.space12),
            contentAreaCardDescription.leadingAnchor.constraint(equalTo: contentAreaCardIconContainer.trailingAnchor, constant: Metrics.space16),
            contentAreaCardDescription.trailingAnchor.constraint(equalTo: contentAreaCard.layoutMarginsGuide.trailingAnchor),
            contentAreaCardDescription.bottomAnchor.constraint(equalTo: contentAreaCard.layoutMarginsGuide.bottomAnchor, constant: -Metrics.space10),
            
            reviewButton.bottomAnchor.constraint(equalTo: contentArea.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.space12),
            reviewButton.leadingAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.leadingAnchor),
            reviewButton.trailingAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.trailingAnchor),
        ])
    }
}
