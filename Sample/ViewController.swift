//
//  ViewController.swift
//  Sample
//
//  Created by Ruchira Munidasa on 8/15/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private let cellReuseIdentifier = "cellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "Vertical Product List"
        case 1:
            cell?.textLabel?.text = "Customer Product View"
        case 2:
            cell?.textLabel?.text = "Merchent Product Info"
        default:
            break
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(SampleVerticalListCollectionViewController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(RMCustomerProductViewController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(RMMerchentProductViewController(), animated: true)
        default:
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

