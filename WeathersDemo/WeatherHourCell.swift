//
//  WeatherHourCell.swift
//  WeathersDemo
//
//  Created by Tran Chung on 6/17/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class WeatherHourCell: UITableViewCell {
    @IBOutlet weak var icon_Hour: UIImageView!
    @IBOutlet weak var temp_Hour: UILabel!
    @IBOutlet weak var text_Hour: UILabel!
    @IBOutlet weak var time_Hour: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
