//
//  AttracionTableViewCell.swift
//  TableViewController
//
//  Created by 503-03 on 2018. 11. 12..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class AttracionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var attrImage: UIImageView!
    @IBOutlet weak var attrLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
