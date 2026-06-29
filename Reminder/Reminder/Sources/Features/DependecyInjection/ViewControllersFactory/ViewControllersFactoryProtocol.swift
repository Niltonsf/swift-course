//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 28/06/26.
//

import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
    
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController
}
