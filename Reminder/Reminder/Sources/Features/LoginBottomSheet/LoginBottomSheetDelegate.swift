//
//  LoginBottomSheetDelegate.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 24/06/26.
//

import Foundation
import UIKit

protocol LoginBottomSheetDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
