//
//  EateriasTableViewController.swift
//  Eaterias
//
//  Created by Serg Kalinin on 01/11/2017.
//  Copyright © 2017 Serg Kalinin. All rights reserved.
//

import UIKit

class EateriasTableViewController: UITableViewController {

    var restaurants: [Restaurant] = [
        Restaurant(name: "Ogonёk Grill&Bar", type: "ресторан", location: "Уфа", image: "ogonek.jpg", isVisited: false),
        Restaurant(name: "Елу", type: "ресторан", location: "Уфа", image: "elu.jpg", isVisited: false),
        Restaurant(name: "Bonsai", type: "ресторан", location: "Уфа", image: "bonsai.jpg", isVisited: false),
        Restaurant(name: "Дастархан", type: "ресторан", location: "Уфа", image: "dastarhan.jpg", isVisited: false),
        Restaurant(name: "Индокитай", type: "ресторан", location: "Уфа", image: "indokitay.jpg", isVisited: false),
        Restaurant(name: "X.O", type: "ресторан-клуб", location: "Уфа", image: "x.o.jpg", isVisited: false),
        Restaurant(name: "Балкан Гриль", type: "ресторан", location: "Уфа", image: "balkan.jpg", isVisited: false),
        Restaurant(name: "Respublica", type: "ресторан", location: "Уфа", image: "respublika.jpg", isVisited: false),
        Restaurant(name: "Speak Easy", type: "ресторанный комплекс", location: "Уфа", image: "speakeasy.jpg", isVisited: false),
        Restaurant(name: "Morris Pub", type: "ресторан", location: "Уфа", image: "morris.jpg", isVisited: false),
        Restaurant(name: "Вкусные истории", type: "ресторан", location: "Уфа", image: "istorii.jpg", isVisited: false),
        Restaurant(name: "Классик", type: "ресторан", location: "Уфа", image: "klassik.jpg", isVisited: false),
        Restaurant(name: "Love&Life", type: "ресторан", location: "Уфа", image: "love.jpg", isVisited: false),
        Restaurant(name: "Шок", type: "ресторан", location: "Уфа", image: "shok.jpg", isVisited: false),
        Restaurant(name: "Бочка", type: "ресторан", location:  "Уфа", image: "bochka.jpg", isVisited: false)]
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
        
        return restaurants.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        cell.thumbnailImageView.image = UIImage(named:restaurants[indexPath.row].image)
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        cell.thumbnailImageView.clipsToBounds = true
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
        return cell
    }
    

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let ac = UIAlertController(title: nil, message:"Выберете действие" , preferredStyle: .actionSheet)
//        let call = UIAlertAction(title:"позвонить 7999214140\(indexPath.row)", style:.default){
//            (action:UIAlertAction) -> Void in
//            let alertC = UIAlertController(title: nil, message:"Вызов не может быть совершен" , preferredStyle: .alert)
//            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alertC.addAction(ok)
//            self.present(alertC, animated: true, completion: nil)
//
//        }
//        let isVisitedTitle = self.restaurants[indexPath.row].isVisited ? "Я здесь не был" :"Я здесь был"
//        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default){
//            (action) in
//            let cell = tableView.cellForRow(at: indexPath)
//            self.restaurants[indexPath.row].isVisited = !self.restaurantIsVisited[indexPath.row]
//            cell?.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
//
//
//
//        }
//        let cancel = UIAlertAction(title:"Отмена", style:.cancel, handler:nil)
//        ac.addAction(call)
//        ac.addAction(isVisited)
//        ac.addAction(cancel)
//        present(ac, animated: true, completion: nil)
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
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
            let defaultText = "Я сейчас в " + self.restaurants[indexPath.row].name
            if let image = UIImage(named:self.restaurants[indexPath.row].image){
                let activityController = UIActivityViewController(activityItems: [defaultText,image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
                
            }
        }
        let delete = UITableViewRowAction(style: .default, title: "Удалить"){
            (action,indexPath) in
            self.restaurants.remove(at: indexPath.row)
           
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        share.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        return [delete,share]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let dvc = segue.destination as! DetailViewController
                dvc.imageName = self.restaurants[indexPath.row].image
                
                
            }
        }
    }

}
