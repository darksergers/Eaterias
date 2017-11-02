//
//  EateriasTableViewController.swift
//  Eaterias
//
//  Created by Serg Kalinin on 01/11/2017.
//  Copyright © 2017 Serg Kalinin. All rights reserved.
//

import UIKit

class EateriasTableViewController: UITableViewController {

    var restaurantNames = ["Ogonёk Grill&Bar", "Елу", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Respublica", "Speak Easy", "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"]
    
    var restaurantImages = ["ogonek.jpg", "elu.jpg", "bonsai.jpg", "dastarhan.jpg", "indokitay.jpg", "x.o.jpg", "balkan.jpg", "respublika.jpg", "speakeasy.jpg", "morris.jpg", "istorii.jpg", "klassik.jpg", "love.jpg", "shok.jpg", "bochka.jpg"]
    var restaurantIsVisited = [Bool](repeatElement(false, count: 15))
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
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
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
        let isVisitedTitle = self.restaurantIsVisited[indexPath.row] ? "Я здесь не был" :"Я здесь был"
        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default){
            (action) in
            let cell = tableView.cellForRow(at: indexPath)
            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
            
            
            
        }
        let cancel = UIAlertAction(title:"Отмена", style:.cancel, handler:nil)
        ac.addAction(call)
        ac.addAction(isVisited)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            self.restaurantNames.remove(at: indexPath.row)
//            self.restaurantImages.remove(at: indexPath.row)
//            self.restaurantIsVisited.remove(at: indexPath.row)
//        }
//        tableView.deleteRows(at: [indexPath], with: .fade)
//
//    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .default, title: "Поделиться"){
            (action,indexPath) in
            let defaultText = "Я сейчас в " + self.restaurantNames[indexPath.row]
            if let image = UIImage(named:self.restaurantImages[indexPath.row]){
                let activityController = UIActivityViewController(activityItems: [defaultText,image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
                
            }
        }
        let delete = UITableViewRowAction(style: .default, title: "Удалить"){
            (action,indexPath) in
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        share.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        return [delete,share]
    }
    
    

}
