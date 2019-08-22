//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Andreas Alfarè on 22.08.19.
//  Copyright © 2019 alfare.it. All rights reserved.
//

import UIKit

class AppCoordinator: SplitCoordinator {
    var childCoordinators = [Coordinator]()
    var detailCoordinator: Coordinator?
    var splitViewController: UISplitViewController
    var navigationController: UINavigationController
    
    var didFinish: ((Coordinator) -> Void)?
    
    init(splitViewController: UISplitViewController) {
        self.splitViewController = splitViewController
        self.navigationController = UINavigationController()
    }
    
    func start() {
        splitViewController.viewControllers = [navigationController]
        
        let primary = ViewController()
        primary.delegate = self
        navigationController.pushViewController(primary, animated: true)
    }
}

extension AppCoordinator: ViewControllerDelegate {
    func didSelectItem() {
        let detailCoordinator = DetailCoordinator(navigationController: UINavigationController())
        detailCoordinator.didFinish = { [weak self] (coordinator) in
            self?.detailCoordinator = nil
        }
        showDetailCoordinator(detailCoordinator)
    }
}
