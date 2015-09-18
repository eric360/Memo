//
//  MTableViewCell.swift
//  Memo
//
//  Created by eric_360 on 18/09/15.
//  Copyright (c) 2015 Eric Hong tuan ha. All rights reserved.
//

import UIKit

class MTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var longitude: UILabel!
    @IBOutlet var latitude: UILabel!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
