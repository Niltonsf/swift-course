//
//  SplashFlowDelegate.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 27/06/26.
//

import Foundation

public protocol SplashFlowDelegate: AnyObject {
    func openLoginBottomSheet()
    func navigateToHome()
}
