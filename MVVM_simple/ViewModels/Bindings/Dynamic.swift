//
//  Dynamic.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 18/05/2022.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> (Void)
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
