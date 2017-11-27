//
//  CustomTableViewCell.swift
//  CustomTableCellExample
//
//  Created by Shani on 11/13/17.
//  Copyright © 2017 Shani Rivers. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImg: UIImageView?
    @IBOutlet weak var categoryLbl: UILabel?
    @IBOutlet weak var recipeNameLbl: UILabel?
    @IBOutlet weak var prepTimeLbl: UILabel?
    @IBOutlet weak var difficultyLbl: UILabel?
    @IBOutlet weak var servingSizeLbl: UILabel?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
