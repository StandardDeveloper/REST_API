//
//  AlarmTableViewCell.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/22.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var pushLabel: UILabel!
    @IBOutlet weak var pushSwitchBtn: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
