//
//  AboutTableViewController.swift
//  Eateries
//
//  Created by Serg Kalinin on 24/03/2018.
//  Copyright © 2018 Serg Kalinin. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {
    
    let sectionsHeaders = ["Мы в социальных сетях","Наши сайты"]
    let sectionsContent = [["vk","instagram"],["https://github.com/darksergers"]]
    let firstSectionLinks = ["https://vk.com/ksi01","https://www.instagram.com/kalininserg94/"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView(frame:CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sectionsHeaders.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionsContent[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = sectionsContent[indexPath.section][indexPath.row]

        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsHeaders[section]
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch  indexPath.section {
        case 0:
            switch indexPath.row {
                case 0..<firstSectionLinks.count:
                    performSegue(withIdentifier: "showWebPageSegue", sender: self)
            default:
                break;
            }
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebPageSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! WebViewController
                dvc.url = URL(string: firstSectionLinks[indexPath.row])
            }
        }
    }
    

}
