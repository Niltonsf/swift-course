//
//  HomeViewController.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 29/06/26.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    let contentView: HomeView
    let homeViewModel: HomeViewModel
    public weak var flowDelegate: HomeFlowDelegate?
    
    init(contentView: HomeView, flowDelegate: HomeFlowDelegate) {
        self.flowDelegate = flowDelegate
        self.contentView = contentView
        self.homeViewModel = HomeViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupNavigationBar()
        setupActionForNewReceipt()
        checkForExistingData()
    }

    private func setup() {
        view.addSubview(contentView)
        contentView.delegate = self
        setupConstraints()
    }
    
    private func setupConstraints() {
        setupContentViewToBounds(contentView: contentView)
    }
    
    private func setupActionForNewReceipt() {
        self.contentView.myPillsCard.tapAction = { [weak self] in
            self?.didTapNewPrescriptionButton()
        }
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        let logoutButton = UIBarButtonItem(image: UIImage(named: "logOutIcon"), style: .plain, target: self, action: #selector(logoutAction))
        logoutButton.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    @objc
    private func logoutAction() {
        UserDefaultsManager.removeUser()
        self.flowDelegate?.navigateToLogin()
    }
    
    private func checkForExistingData() {
        if UserDefaultsManager.loadUser() != nil {
            contentView.headerUserNameTextField.text = UserDefaultsManager.loadUsername()
        }
        
        if UserDefaultsManager.loadProfileImage() != nil {
            contentView.headerProfileImage.image = UserDefaultsManager.loadProfileImage()
        }
    }
}

extension HomeViewController: HomeViewDelegate {
    func didTapProfileImage() {
        self.selectProfileImage()
    }
    
    func didTapNewPrescriptionButton() {
        self.flowDelegate?.navigateToRecipes()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func selectProfileImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    internal func imagePickerController(_ _picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            contentView.headerProfileImage.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            contentView.headerProfileImage.image = originalImage
        }
        
        UserDefaultsManager.saveProfileImage(profileImage: contentView.headerProfileImage.image!)
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
