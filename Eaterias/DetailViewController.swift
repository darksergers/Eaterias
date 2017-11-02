//
//  DetailViewController.swift
//  Eaterias
//
//  Created by Serg Kalinin on 03.11.17.
//  Copyright © 2017 Serg Kalinin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: imageName)
    }

    

}
