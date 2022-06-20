//
//  UserViewModel.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 04/06/2022.
//

import UIKit

struct UserViewModel {
    let name: String?
    let password: String?
    var isAdmin: Bool
    let image: UIImage?
    
    init(with model: User) {
        name = model.login
        password = model.password
        isAdmin = model.isAdmin
        image = model.image
    }
}
