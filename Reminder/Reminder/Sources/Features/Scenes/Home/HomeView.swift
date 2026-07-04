//
//  HomeView.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 29/06/26.
//

import Foundation
import UIKit

class HomeView: UIView {
    weak public var delegate: HomeViewDelegate?
    
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
        self.addSubview(headerWelcomeText)
        self.addSubview(headerUserNameTextField)
        
        self.addSubview(contentArea)
        contentArea.addSubview(myPrescriptionCard)
        contentArea.addSubview(myPillsCard)
        contentArea.addSubview(reviewButton)

        setupConstrains()
        setupImageGesture()
        setupTextField()
    }
    
    private let headerProfileArea: UIView = {
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal let headerProfileImage: UIImageView = {
        let uiImageView = UIImageView()
        let imageSize = 64.0
        uiImageView.isUserInteractionEnabled = true
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
    
    private let headerWelcomeText: UILabel = {
        let label = UILabel()
        label.text = "home.welcome".localized
        label.font = Typography.input
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let myPrescriptionCard: HomeViewCard = {
        let card = HomeViewCard(icon: UIImage(named: "paper"), title: "Minhas receitas", description: "Acompanhe os medicamentos e gerencie lembretes")
        return card
    }()
    
    let myPillsCard: HomeViewCard = {
        let card = HomeViewCard(icon: UIImage(named: "pills"), title: "Nova receita", description: "Cadastre novos lembretes de receitas")
        return card
    }()
    
    internal let headerUserNameTextField: UITextField = {
        let uITextField = UITextField()
        uITextField.font = Typography.heading
        uITextField.returnKeyType = .done
        uITextField.textColor = Colors.gray200
        uITextField.placeholder = "home.username.placeholder".localized
        uITextField.translatesAutoresizingMaskIntoConstraints = false
        return uITextField
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
            headerProfileArea.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            headerProfileArea.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.space32),
            headerProfileArea.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.space32),
            headerProfileArea.bottomAnchor.constraint(equalTo: contentArea.topAnchor, constant: -Metrics.space32),
            
            headerProfileImage.topAnchor.constraint(equalTo: headerProfileArea.topAnchor),
            headerProfileImage.leadingAnchor.constraint(equalTo: headerProfileArea.leadingAnchor),
            
            headerWelcomeText.topAnchor.constraint(equalTo: headerProfileImage.bottomAnchor, constant: Metrics.space16),
            headerWelcomeText.leadingAnchor.constraint(equalTo: headerProfileArea.leadingAnchor),
            
            headerUserNameTextField.topAnchor.constraint(equalTo: headerWelcomeText.bottomAnchor, constant: Metrics.space4),
            headerUserNameTextField.leadingAnchor.constraint(equalTo: headerProfileArea.leadingAnchor),
            
            contentArea.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentArea.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentArea.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentArea.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            
            myPrescriptionCard.topAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.topAnchor),
            myPrescriptionCard.leadingAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.leadingAnchor),
            myPrescriptionCard.trailingAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.trailingAnchor),
            
            myPillsCard.topAnchor.constraint(equalTo: myPrescriptionCard.bottomAnchor, constant: Metrics.space12),
            myPillsCard.leadingAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.leadingAnchor),
            myPillsCard.trailingAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.trailingAnchor),
            
            reviewButton.bottomAnchor.constraint(equalTo: contentArea.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.space12),
            reviewButton.leadingAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.leadingAnchor),
            reviewButton.trailingAnchor.constraint(equalTo: contentArea.layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    private func setupImageGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        headerProfileImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    private func profileImageTapped() {
        self.delegate?.didTapProfileImage()
    }
    
    private func setupTextField() {
        headerUserNameTextField.addTarget(self, action: #selector(nameTextFieldDidEndEditing), for: .editingDidEnd)
        headerUserNameTextField.delegate = self
    }
    
    @objc
    private func nameTextFieldDidEndEditing() {
        let username = headerUserNameTextField.text ?? ""
        UserDefaults.standard.set(username, forKey: "userName")
    }
}

extension HomeView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let username = headerUserNameTextField.text ?? ""
        UserDefaults.standard.set(username, forKey: "userName")
        return true
    }
}
