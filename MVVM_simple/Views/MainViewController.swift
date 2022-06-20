//
//  MainViewController.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 22/05/2022.
//

import UIKit

class MainViewController: UIViewController, Storyboardable {
    
    @IBOutlet var mainLabel: UILabel!
    @IBAction func aboutButtonPressed(_ sender: Any) {
        coordinator?.showDetail()
    }
    @IBAction func usersButtonPressed(_ sender: Any) {
        coordinator?.showUsers()
    }
    @IBAction func usersNameAPIButtonPressed(_ sender: Any) {
        coordinator?.showUsersAPI()
    }
    weak var coordinator: AppCoordinator?
    var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Main screen loaded")
        mainLabel.text = "Hello \(viewModel?.login ?? "Default")"
    }
}
