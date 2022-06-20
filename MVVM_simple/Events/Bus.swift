//
//  Bus.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 04/06/2022.
//

import UIKit

final class Bus {
    static let shared = Bus()
    
    private init() {
        
    }
    
    enum EventType {
        case userFetch
    }
    
    struct Subscription {
        let type: EventType
        let queue: DispatchQueue
        let block: ((Event<[UserAPI]>) -> Void)
    }
    
    private var subscriptions = [Subscription]()
    
    // Subscriptions
    func subscribe(_ event: EventType, block: @escaping((Event<[UserAPI]>) -> Void)) {
        let new = Subscription(type: event, queue: .global(), block: block)
        subscriptions.append(new)
    }
    func subscribeOnMain(_ event: EventType, block: @escaping((Event<[UserAPI]>) -> Void)) {
        let new = Subscription(type: event, queue: .global(), block: block)
        subscriptions.append(new)
    }
    
    // Publications
    func publish(type: EventType, event: UserFetchEvent) {
        let subscribers = subscriptions.filter({ $0.type == type })
        subscribers.forEach { subscriber in
            subscriber.queue.async {
                subscriber.block(event)
            }
        }
    }
}
