//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 07/01/26.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    public weak var delegate: LoginBottomSheetDelegate?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
        let exampleGest = UITapGestureRecognizer(target: self, action: #selector(exampleTaped))
        titleLabel.addGestureRecognizer(exampleGest)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loginButton.layer.cornerRadius = loginButton.bounds.height / 2
        loginButton.clipsToBounds = true
    }
    
    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.little
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "login.title".localized
        label.font = Typography.subHeading
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.email.title".localized
        label.font = Typography.label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "login.email.placeholder".localized
        textField.borderStyle = .none
        textField.layer.cornerRadius = Metrics.tiny
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.clipsToBounds = true
        textField.setHorizontalPadding(Metrics.big)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.password.title".localized
        label.font = Typography.label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "login.password.placeholder".localized
        textField.borderStyle = .none
        textField.layer.cornerRadius = Metrics.tiny
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.clipsToBounds = true
        textField.setHorizontalPadding(Metrics.big)
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordEyeButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "eye.slash")
        button.setImage(image, for: .normal)
        button.tintColor = Colors.primaryBlueBase
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        return button
    }()
    
    private lazy var passwordRightView: UIView = {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 56))
        
        passwordEyeButton.center = CGPoint(
            x: container.bounds.width / 2,
            y: container.bounds.height / 2
        )
        
        container.addSubview(passwordEyeButton)
        return container
    }()

    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.title".localized, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.setTitleColor(Colors.white, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        passwordEyeButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc
    private func exampleTaped() {
        print("Clicou na label")
    }
    
    private func setup() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        passwordTextField.rightView = passwordRightView
        passwordTextField.rightViewMode = .always
        
        self.addSubview(handleArea)
        self.addSubview(titleLabel)
        self.addSubview(emailTextFieldLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextFieldLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)

        setupConstrains()
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.small),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLabel.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
                        
            emailTextFieldLabel.topAnchor
                .constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            emailTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldLabel.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
                     
            passwordTextFieldLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldLabel.bottomAnchor, constant: Metrics.small),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.huge),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.huge),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
        ])
    }
    
    @objc
    private func loginButtonDidTap() {
        guard let user = emailTextField.text else {
            return
        }
        let password = passwordTextField.text ?? ""
        //        let user = emailTextField.text
        
        delegate?.sendLoginData(user: user, password: password)
    }
}
