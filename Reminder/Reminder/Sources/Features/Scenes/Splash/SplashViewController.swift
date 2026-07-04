//
//  SplashViewController.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 17/12/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    let contentView: SplashView
    public weak var flowDelegate: SplashFlowDelegate?
    
    init(contentView: SplashView, flowDelegate: SplashFlowDelegate) {
        self.flowDelegate = flowDelegate
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        setup()
        startBreathingAnimation()
//        setupGesture()
    }
    
    private func decideNavigationFlow() {
        if let user = UserDefaultsManager.loadUser(), user.isUserSaved {
            self.flowDelegate?.navigateToHome()
        } else {
            self.showLoginBottomSheet()
        }
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.primaryRedBase
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        setupContentViewToBounds(contentView: contentView)
    }
    
//    private func setupGesture () {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
//        self.view.addGestureRecognizer(tapGesture)
//    }
    
    @objc
    private func showLoginBottomSheet() {
        self.animateLogoUp()
        self.flowDelegate?.openLoginBottomSheet()
    }
}

// MARK: - Animations
extension SplashViewController {
    private func startBreathingAnimation() {
        UIView.animate(withDuration: 0.8, delay: 0.0, animations: {
            self.contentView.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            self.decideNavigationFlow()
        })
    }
    
    private func animateLogoUp() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
            self.contentView.logoImageView.transform = self.contentView.logoImageView.transform.translatedBy(x: 0, y: -150)
        })
    }
}
