//
//  ViewController.swift
//  Coordinator
//
//  Created by Andreas Alfarè on 22.08.19.
//  Copyright © 2019 alfare.it. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func didSelectItem()
}

class ViewController: UITableViewController {
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .cyan
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Item"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem()
    }
}

