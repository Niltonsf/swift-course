//
//  UITextField+Padding.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 19/01/26.
//

import Foundation
import UIKit

extension UITextField {
    func setHorizontalPadding(_ padding: CGFloat) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 1))
        leftView = view
        leftViewMode = .always
    }
}
