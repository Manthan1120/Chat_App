//
//  SearchPage.swift
//  Chat_App
//
//  Created by r86 on 19/07/23.
//

import UIKit

class SearchPage: UIViewController {

    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var userNameLabelOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
       
    }
    
    func set() {
        imageOutlet.layer.cornerRadius = 45
        imageOutlet.layer.masksToBounds = true
    }
    

}
