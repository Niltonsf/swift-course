//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 25/06/26.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var successResult: ((String) -> Void)?
    var errorResult: ((String) -> Void)?
    
    func doAuth(usernameLogin: String, passwordLogin: String) {
        Auth.auth().signIn(withEmail: usernameLogin, password: passwordLogin) { [weak self] authResult, error in
            if let error = error {
                self?.errorResult?(error.localizedDescription)
            } else {
                self?.successResult?(usernameLogin)
            }
        }
    }
}

