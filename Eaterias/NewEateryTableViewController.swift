//
//  NewEateryTableViewController.swift
//  Eaterias
//
//  Created by Serg Kalinin on 06.11.17.
//  Copyright © 2017 Serg Kalinin. All rights reserved.
//

import UIKit

class NewEateryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            let alertController = UIAlertController(title:"Источник фотографий",message:nil,preferredStyle:.actionSheet)
            
        }
    }

}
