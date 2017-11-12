//
//  DetailViewController.swift
//  Eaterias
//
//  Created by Serg Kalinin on 03.11.17.
//  Copyright © 2017 Serg Kalinin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    var restaurant:Restaurant?
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard let svc = segue.source as? RateViewController else {return}
        guard let rating =  svc.restRaiting else {return}
        rateButton.setImage(UIImage(named:rating), for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableViewAutomaticDimension
        let buttons = [mapButton,rateButton]
        for button in buttons {
            guard let button = button else {break}
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
        }
        
        
        imageView.image = UIImage(named: restaurant!.image)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        title = restaurant!.name
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Название"
            cell.valueLabel.text = restaurant!.name
        case 1:
            cell.keyLabel.text = "Тип"
            cell.valueLabel.text = restaurant!.type
        case 2:
            cell.keyLabel.text = "Адрес"
            cell.valueLabel.text = restaurant!.location
        case 3:
            cell.keyLabel.text = "Я там был? "
            cell.valueLabel.text = restaurant!.isVisited ? "Да":"Нет"
        default:
            break;
        }
        cell.backgroundColor = UIColor.clear
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapSegue" {
            let dvc = segue.destination as! MapViewController
             dvc.restaurant = self.restaurant
        }
            
    }

}
