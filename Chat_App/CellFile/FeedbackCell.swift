//
//  FeedbackCell.swift
//  Chat_App
//
//  Created by r85 on 28/08/23.
//

import UIKit

class FeedbackCell: UITableViewCell {

    @IBOutlet weak var textViewForFeedBack: UITextView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
