//
//  DetailCoordinator.swift
//  Coordinator
//
//  Created by Andreas Alfarè on 22.08.19.
//  Copyright © 2019 alfare.it. All rights reserved.
//

import UIKit

class DetailCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var didFinish: ((Coordinator) -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        debugPrint("### DEINIT DetailCoordinator")
    }
    
    func start() {
        let detailViewController = DetailViewController()
        detailViewController.title = "Detail"
        detailViewController.delegate = self
        detailViewController.view.backgroundColor = .blue
        navigationController.pushViewController(detailViewController, animated: true)
    }
}

extension DetailCoordinator: DetailViewControllerDelegate {
    func doSomething() {
        let somethingViewController = UIViewController()
        somethingViewController.title = "Something..."
        somethingViewController.view.backgroundColor = .purple
        navigationController.pushViewController(somethingViewController, animated: true)
    }
}
