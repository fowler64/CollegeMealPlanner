//
//  MealTableViewCell.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 8/3/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var PaymentLabel: UILabel!
    @IBOutlet weak var RestaurantLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
