//
//  CustomTableCell.swift
//  Pupil
//
//  Created by Jordan Alnaser on 4/23/17.
//  Copyright © 2017 Jordan Alnaser. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    // IBOutlets for the Custom cell view, these were disgned in the StoryBoard, and connected programtically to this class
    @IBOutlet weak var assignmentName: UILabel!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
