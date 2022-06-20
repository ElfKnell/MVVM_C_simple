//
//  EventNameViewController.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 04/06/2022.
//

import UIKit

class EventNameViewController: UIViewController, Storyboardable, UITableViewDataSource {
    
    weak var coordinator: AppCoordinator?
    private var viewModel = UserAPIListViewModel()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self

        Bus.shared.subscribeOnMain(.userFetch) { [weak self] event in
            guard let result = event.result else { return }

            switch result {
            case .success(let users):
                self?.viewModel.usersAPI = users
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }

        viewModel.fetchUserAPIList()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.usersAPI[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.usersAPI.count
    }
}
