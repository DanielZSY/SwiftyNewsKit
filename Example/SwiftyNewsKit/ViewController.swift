//
//  ViewController.swift
//  SwiftyNewsKit
//
//  Created by DanielZSY on 05/18/2021.
//  Copyright (c) 2021 DanielZSY. All rights reserved.
//

import UIKit
import SwiftyNewsKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let itemvc = ZMessageViewController()
            
            self.navigationController?.pushViewController(itemvc, animated: true)
        default: break
        }
    }
}

