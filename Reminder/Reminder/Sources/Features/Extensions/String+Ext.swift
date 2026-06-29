//
//  String+Ext.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 19/01/26.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
