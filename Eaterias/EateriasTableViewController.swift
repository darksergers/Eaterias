//
//  EateriasTableViewController.swift
//  Eaterias
//
//  Created by Serg Kalinin on 01/11/2017.
//  Copyright © 2017 Serg Kalinin. All rights reserved.
//

import UIKit

class EateriasTableViewController: UITableViewController {

    let restaurantNames = ["Ogonёk Grill&Bar", "Елу", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Respublica", "Speak Easy", "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"]
    
    let restaurantImages = ["ogonek.jpg", "elu.jpg", "bonsai.jpg", "dastarhan.jpg", "indokitay.jpg", "x.o.jpg", "balkan.jpg", "respublika.jpg", "speakeasy.jpg", "morris.jpg", "istorii.jpg", "klassik.jpg", "love.jpg", "shok.jpg", "bochka.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurantNames.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        cell.thumbnailImageView.image = UIImage(named:restaurantImages[indexPath.row])
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        cell.thumbnailImageView.clipsToBounds = true
        cell.nameLabel.text = restaurantNames[indexPath.row]
        

        

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let ac = UIAlertController(title: nil, message:"Выберете действие" , preferredStyle: .actionSheet)
        let call = UIAlertAction(title:"позвонить 7999214140\(indexPath.row)", style:.default){
            (action:UIAlertAction) -> Void in
            let alertC = UIAlertController(title: nil, message:"Вызов не может быть совершен" , preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertC.addAction(ok)
            self.present(alertC, animated: true, completion: nil)
            
        }
        let isVisited = UIAlertAction(title: "Я здесь был", style: .default){
            (action) in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            
        }
        let cancel = UIAlertAction(title:"Отмена", style:.cancel, handler:nil)
        ac.addAction(cancel)
        ac.addAction(isVisited)
        ac.addAction(call)
        present(ac, animated: true, completion: nil)
    }
    
    
    

}
