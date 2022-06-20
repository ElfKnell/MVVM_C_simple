//
//  UserAPIListViewModel.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 05/06/2022.
//

import Foundation

struct UserAPIListViewModel {
    
    public var usersAPI: [UserAPI] = []
    
    public func fetchUserAPIList() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }
            let event: UserFetchEvent
            do {
                let users = try JSONDecoder().decode([UserAPI].self, from: data)
                event = UserFetchEvent(identifier: UUID().uuidString, result: .success(users))
            }
            catch {
                event = UserFetchEvent(identifier: UUID().uuidString, result: .failure(error))
            }
            Bus.shared.publish(type: .userFetch, event: event)
        }
        task.resume()
    }
    
}
