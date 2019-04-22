//
//  AlarmTableViewCell.swift
//  masca
//
//  Created by Jessica Liu on 4/21/19.
//  Copyright © 2019 Tomas Vega. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var numAlarmLabel: UILabel!
    var isEnabled: Bool!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
