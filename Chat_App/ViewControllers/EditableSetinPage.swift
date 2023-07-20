//
//  EditableSetinPage.swift
//  Chat_App
//
//  Created by r86 on 19/07/23.
//

import UIKit

class EditableSetinPage: UIViewController {

    @IBOutlet weak var doneButtonOutlet: UIButton!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var userNameLabelOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageOutlet.layer.cornerRadius = 45
        imageOutlet.layer.masksToBounds = true
        
    }
    

    @IBAction func doneButtonAction(_ sender: Any) {
        
    }
    

}
