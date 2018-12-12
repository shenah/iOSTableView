
//
//  CustcomCell.swift
//  CustomViewUse
//
//  Created by 503-03 on 2018. 11. 12..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class CustcomCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
