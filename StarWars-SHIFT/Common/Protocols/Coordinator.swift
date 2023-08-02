//
//  Coordinator.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.08.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start()
    func removeChildCoordinators()
    func didFinish(coordinator: Coordinator)
    func coordinate(to coordinator: Coordinator)
}
