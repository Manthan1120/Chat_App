//
//  CellForUserFriendDetail.swift
//  Chat_App
//
//  Created by r86 on 25/07/23.
//

import UIKit

class CellForUserFriendDetail: UITableViewCell {

    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var ProfileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
