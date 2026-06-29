//
//  ReminderCordinator.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 27/06/26.
//

import Foundation
import UIKit

class ReminderFlowController {
    // MARK: - Properties
    private var navigationController: UINavigationController?
    private var viewControllersFactory: ViewControllersFactoryProtocol
    
    // MARK: - Init
    public init() {
        viewControllersFactory = ViewControllersFactory()
    }
    
    // MARK: - StartFlow
    func start() -> UINavigationController? {
        let startViewController = viewControllersFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }
}

// MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        let homeViewController = viewControllersFactory.makeHomeViewController(flowDelegate: self)
        self.navigationController?.dismiss(animated: false)
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}

// MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheetViewController = viewControllersFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheetViewController.modalPresentationStyle = .overCurrentContext
        loginBottomSheetViewController.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheetViewController, animated: false) {
            loginBottomSheetViewController.animateShow()
        }    
    }
}

// MARK: - Home
extension ReminderFlowController: HomeFlowDelegate {

}
