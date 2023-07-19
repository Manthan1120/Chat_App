//
//  SearchPage.swift
//  Chat_App
//
//  Created by r86 on 19/07/23.
//

import UIKit

class SearchPage: UIViewController {

   
    @IBOutlet weak var editButtonOutlet: UIButton!
    @IBOutlet weak var genderLabelOutlet: UILabel!
    @IBOutlet weak var numberLabelOutlet: UILabel!
    @IBOutlet weak var birthDateLabelOutlet: UILabel!
    @IBOutlet weak var bioLabelOutlet: UILabel!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var userNameLabelOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageOutlet.layer.cornerRadius = 45
        imageOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        imageOutlet.layer.shadowRadius = 4.0
        imageOutlet.layer.shadowOpacity = 4.4
        imageOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        imageOutlet.layer.masksToBounds = false
        set()
       
    }
    
    func set() {
       
        bioLabelOutlet.layer.cornerRadius = 7
        bioLabelOutlet.layer.masksToBounds = true
        
        birthDateLabelOutlet.layer.cornerRadius = 7
        birthDateLabelOutlet.layer.masksToBounds = true
        
        numberLabelOutlet.layer.cornerRadius = 7
        numberLabelOutlet.layer.masksToBounds = true
        
        genderLabelOutlet.layer.cornerRadius = 7
        genderLabelOutlet.layer.masksToBounds = true
        
        editButtonOutlet.layer.cornerRadius = 11
        editButtonOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        editButtonOutlet.layer.shadowRadius = 4.0
        editButtonOutlet.layer.shadowOpacity = 4.4
        editButtonOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        editButtonOutlet.layer.masksToBounds = false
    }
    

}
