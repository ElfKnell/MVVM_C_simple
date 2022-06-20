//
//  Coordinator.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 19/05/2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
