//
//  UsersViewController.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 31/05/2022.
//

import UIKit

class UsersViewController: UIViewController, Storyboardable, UITableViewDataSource {
    
    weak var coordinator: AppCoordinator?
    var viewModel: UsersViewModel?
    private var models = [UserViewModel]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UsersTableViewCell.self, forCellReuseIdentifier: UsersTableViewCell.idetifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUser()
        //print(models)

        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func setUser() {
        guard let model = viewModel?.model else { return }
        models = model
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.idetifier, for: indexPath) as? UsersTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        cell.delegat = self
        return cell
    }
  
}

extension UsersViewController: UsersTableViewCellDelegat {
    func usersTableViewCell(cell: UsersTableViewCell, didTapWith viewModel: UserViewModel) {
        
    }
}

