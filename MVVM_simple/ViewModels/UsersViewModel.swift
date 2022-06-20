//
//  UsersViewModel.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 31/05/2022.
//

import Foundation

class UsersViewModel {
    var model: [UserViewModel]

    init(with modelu: [User]) {
        var mU: UserViewModel
        var m = [UserViewModel]()
        for user in modelu {
            mU = UserViewModel(with: user)
            
            m.append(mU)
        }
        model = m
    }
}
