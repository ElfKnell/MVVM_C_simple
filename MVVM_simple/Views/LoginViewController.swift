//
//  ViewController.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 18/05/2022.
//

import UIKit

class LoginViewController: UIViewController, Storyboardable {
    
    var viewModel: LoginViewModel?
    var coordinator: AppCoordinator?
    

    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        viewModel!.userButtonPressed(login: loginField.text ?? "", password: passField.text ?? "")
        if viewModel!.isLoggedIn {
            coordinator?.isLoggedIn = viewModel!.isLoggedIn
            coordinator?.showMain(login: loginField.text ?? "")
        }
    }
    
    func initialState() {
        label.text = ""
        //label.textColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        initialState()
    }
    
    func bindViewModel() {
        viewModel!.statusText.bind( { (statusText) in
            DispatchQueue.main.async {
                self.label.text = statusText
            }
        })
        viewModel!.statusColor.bind { (statusColor) in
            DispatchQueue.main.async {
                self.label.textColor = statusColor
            }
        }
    }

}

