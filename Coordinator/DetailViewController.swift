//
//  DetailViewController.swift
//  Coordinator
//
//  Created by Andreas Alfarè on 22.08.19.
//  Copyright © 2019 alfare.it. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func doSomething()
}

class DetailViewController: UIViewController {
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue

        let button = UIButton(type: .detailDisclosure)
        button.frame = view.bounds
        button.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
    }
    
    @objc func buttonTapped() {
        delegate?.doSomething()
    }
}
