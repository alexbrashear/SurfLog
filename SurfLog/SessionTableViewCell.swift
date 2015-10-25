//
//  SessionTableViewCell.swift
//  SurfLog
//
//  Created by Alex Brashear on 10/24/15.
//  Copyright © 2015 Alex Brashear. All rights reserved.
//

import UIKit

class SessionTableViewCell: UITableViewCell {

    @IBOutlet var wavesSurfedLabel: UILabel!
    @IBOutlet var timeInWaterLabel: UILabel!
    @IBOutlet var spotLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var ratingView: UIView!
    @IBOutlet var sessionImage: UIImageView!

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
