//
//  Event.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 04/06/2022.
//

import Foundation

class Event<T> {
    let identifier: String
    let result: Result<T, Error>?
    
    init(identifier: String, result: Result<T, Error>?) {
        self.identifier = identifier
        self.result = result
    }
}

// Sub-class of Event

class UserFetchEvent: Event<[UserAPI]> {
    
}
