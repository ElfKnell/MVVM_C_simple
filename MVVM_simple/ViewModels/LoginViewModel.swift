//
//  ViewModel.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 18/05/2022.
//

import Foundation
import UIKit.UIColor

class LoginViewModel {
    var statusText = Dynamic("")
    var statusColor = Dynamic(UIColor.white)
    var isLoggedIn = false
    
    func userButtonPressed(login: String, password: String) {
        var userLogin = ""
        var userPassword = ""
        for user in User.logins {
            if login == user.login && password == user.password {
                userLogin = login
                userPassword = password
            }
        }
        if login != userLogin || password != userPassword {
            statusText.value = "Log in failed."
            statusColor.value = UIColor.red
            isLoggedIn = false
        } else {
            statusText.value = "You successfully logged in."
            statusColor.value = UIColor.green
            isLoggedIn = true
        }
    }
}
