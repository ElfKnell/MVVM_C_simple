//
//  User.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 18/05/2022.
//

import UIKit

struct User {
    let login: String?
    let password: String?
    let image: UIImage?
    let isAdmin: Bool
}

extension User {
    static var logins = [
        User(login: "knell", password: "12345", image: UIImage(systemName: "person"), isAdmin: true),
        User(login: "new", password: "111", image: UIImage(systemName: "person"), isAdmin: false),
        User(login: "second", password: "qwe", image: UIImage(systemName: "person"), isAdmin: false)
    ]
}
