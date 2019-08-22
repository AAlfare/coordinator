//
//  Coordinator.swift
//  Coordinator
//
//  Created by Andreas Alfarè on 22.08.19.
//  Copyright © 2019 alfare.it. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var rootViewController: UIViewController { get }
    var didFinish: ((Coordinator) -> Void)? { get set }
    
    func start()
    
    func pushCoordinator(_ coordinator: Coordinator)
    func popCoordinator(_ coordinator: Coordinator)
}

extension Coordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
    
    // Adds coordinator to child coordinators and calls start function
    func pushCoordinator(_ coordinator: Coordinator) {
        coordinator.didFinish = { [weak self] (coordinator) in
            self?.popCoordinator(coordinator)
        }
        
        coordinator.start()
        
        childCoordinators.append(coordinator)
    }
    
    // Removes coordinator from child coordinators
    func popCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}

protocol SplitCoordinator: Coordinator {
    var splitViewController: UISplitViewController { get set }
    var detailCoordinator: Coordinator? { get set }
}

extension SplitCoordinator {
    var rootViewController: UIViewController {
        return splitViewController
    }
    
    func showDetailCoordinator(_ coordinator: Coordinator) {
        if let detailCoordinator = detailCoordinator {
            detailCoordinator.didFinish?(detailCoordinator)
        }
        pushCoordinator(coordinator)
        detailCoordinator = coordinator
        splitViewController.showDetailViewController(coordinator.rootViewController, sender: nil)
    }
}

protocol TabCoordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var tabBarController: UITabBarController { get set }
    
    func start()
}

extension TabCoordinator {
    var rootViewController: UIViewController {
        return tabBarController
    }
    
    func start() {
        tabBarController.viewControllers = childCoordinators.map { coordinator in
            coordinator.start()
            return coordinator.rootViewController
        }
    }
}

