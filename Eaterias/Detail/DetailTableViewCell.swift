//
//  DetailTableViewCell.swift
//  Eaterias
//
//  Created by Serg Kalinin on 04.11.17.
//  Copyright © 2017 Serg Kalinin. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
