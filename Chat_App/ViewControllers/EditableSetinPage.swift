//
//  EditableSetinPage.swift
//  Chat_App
//
//  Created by r86 on 19/07/23.
//

import UIKit

class EditableSetinPage: UIViewController {

    @IBOutlet weak var genderTxtOutlet: UITextField!
    @IBOutlet weak var numberTxtOutlet: UITextField!
    @IBOutlet weak var birthdateTxtOutlet: UITextField!
    @IBOutlet weak var bioTextViewOutlet: UITextView!
    @IBOutlet weak var doneButtonOutlet: UIButton!
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
        
        doneButtonOutlet.layer.cornerRadius = 11
        doneButtonOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        doneButtonOutlet.layer.shadowRadius = 4.0
        doneButtonOutlet.layer.shadowOpacity = 4.4
        doneButtonOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        doneButtonOutlet.layer.masksToBounds = false
        
        bioTextViewOutlet.layer.cornerRadius = 7
        bioTextViewOutlet.layer.masksToBounds = true
        
        genderTxtOutlet.layer.cornerRadius = 9
        genderTxtOutlet.layer.masksToBounds = true
        
        numberTxtOutlet.layer.cornerRadius = 9
        numberTxtOutlet.layer.masksToBounds = true
        
        birthdateTxtOutlet.layer.cornerRadius = 9
        birthdateTxtOutlet.layer.masksToBounds = true
        
    }
    

    @IBAction func doneButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
