//
//  UserData.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 22/05/2022.
//

import Foundation

struct UserData {
    var name: String?
    var city: String?
    var email: String?
    var phone: String?
}

extension UserData {
    static var userData = UserData(name: "Dima", city: "Kyiv", email: "dnKv@gmail.com", phone: "+380962345267")
}
