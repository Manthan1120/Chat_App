//
//  ChangePasswordePage.swift
//  Chat_App
//
//  Created by r85 on 05/08/23.
//

import UIKit

class ChangePasswordePage: UIViewController {
    
    @IBOutlet weak var bgForKey: UIView!
    @IBOutlet weak var FirstPasswordTextField: UITextField!
    @IBOutlet weak var SecondPasswordTextField: UITextField!
    @IBOutlet weak var DoneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        allUi()
    }
    func allUi(){
        bgForKey.layer.cornerRadius = 100
        bgForKey.layer.masksToBounds = true
        
        FirstPasswordTextField.layer.backgroundColor = UIColor.white.cgColor
        FirstPasswordTextField.layer.cornerRadius = 9
        FirstPasswordTextField.layer.shadowColor = UIColor.systemGray4.cgColor
        FirstPasswordTextField.layer.shadowRadius = 4.0
        FirstPasswordTextField.layer.shadowOpacity = 4.4
        FirstPasswordTextField.layer.shadowOffset = CGSize(width: 4, height: 4)
        FirstPasswordTextField.layer.masksToBounds = false
        
        SecondPasswordTextField.layer.backgroundColor = UIColor.white.cgColor
        SecondPasswordTextField.layer.cornerRadius = 9
        SecondPasswordTextField.layer.shadowColor = UIColor.systemGray4.cgColor
        SecondPasswordTextField.layer.shadowRadius = 4.0
        SecondPasswordTextField.layer.shadowOpacity = 4.4
        SecondPasswordTextField.layer.shadowOffset = CGSize(width: 4, height: 4)
        SecondPasswordTextField.layer.masksToBounds = false
        
        DoneButton.layer.cornerRadius = 9
        DoneButton.layer.shadowColor = UIColor.systemGray4.cgColor
        DoneButton.layer.shadowRadius = 4.0
        DoneButton.layer.shadowOpacity = 4.4
        DoneButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        DoneButton.layer.masksToBounds = false
    }
    


}
