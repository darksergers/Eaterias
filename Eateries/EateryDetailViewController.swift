//
//  DetailViewController.swift
//  Eaterias
//
//  Created by Serg Kalinin on 03.11.17.
//  Copyright © 2017 Serg Kalinin. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var rateButton: UIButton!
  @IBOutlet weak var mapButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var imageView: UIImageView!
  var restaurant: Restaurant?
  
  @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    guard let svc = segue.source as? RateViewController else { return }
    guard let rating = svc.restRating else { return }
    rateButton.setImage(UIImage(named: rating), for: .normal)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.hidesBarsOnSwipe = false
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let rate = Int(truncatingIfNeeded:(restaurant?.rate)!)
    switch  rate {
    case 0:
        rateButton.setImage(UIImage(named: "bad"), for: .normal)
    case 1:
        rateButton.setImage(UIImage(named: "good"), for: .normal)
    case 2:
        rateButton.setImage(UIImage(named: "brilliant"), for: .normal)
    default: break
    }
    

    let buttons = [rateButton, mapButton]
    for button in buttons {
      guard let button = button else { break }
      button.layer.cornerRadius = 5
      button.layer.borderWidth = 1
      button.layer.borderColor = UIColor.white.cgColor
    }
    tableView.estimatedRowHeight = 38
    tableView.rowHeight = UITableViewAutomaticDimension
    
    imageView.image = UIImage(data: restaurant!.image!  as Data)
    tableView.tableFooterView = UIView(frame: CGRect.zero)
    title = restaurant!.name
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateryDetailTableViewCell
    
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
      cell.keyLabel.text = "Я там был?"
      cell.valueLabel.text = restaurant!.isVisited ? "Да" : "Нет"
    default:
      break
    }
    
    cell.backgroundColor = UIColor.clear
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "mapSegue" {
      let dvc = segue.destination as! MapViewController
      dvc.restaurant = self.restaurant
    } else if segue.identifier == "rateSegue" {
        let dvc = segue.destination as! RateViewController
        dvc.restaurant = self.restaurant
    }
  }
  
  
  
  
  
  
  
}
