//
//  PasswordChange.swift
//  Chat_App
//
//  Created by r85 on 22/07/23.
//

import UIKit

class PasswordChange: UIViewController {

    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var ConfirmPasswordTextField: UITextField!
    
    @IBOutlet weak var DoneButtonOt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AllUi()
    }
    
    func AllUi(){
       
        PasswordTextField.layer.backgroundColor = UIColor.white.cgColor
        PasswordTextField.layer.cornerRadius = 9
        PasswordTextField.layer.shadowColor = UIColor.systemGray4.cgColor
        PasswordTextField.layer.shadowRadius = 4.0
        PasswordTextField.layer.shadowOpacity = 4.4
        PasswordTextField.layer.shadowOffset = CGSize(width: 4, height: 4)
        PasswordTextField.layer.masksToBounds = false
        
        ConfirmPasswordTextField.layer.backgroundColor = UIColor.white.cgColor
        ConfirmPasswordTextField.layer.cornerRadius = 9
        ConfirmPasswordTextField.layer.shadowColor = UIColor.systemGray4.cgColor
        ConfirmPasswordTextField.layer.shadowRadius = 4.0
        ConfirmPasswordTextField.layer.shadowOpacity = 4.4
        ConfirmPasswordTextField.layer.shadowOffset = CGSize(width: 4, height: 4)
        ConfirmPasswordTextField.layer.masksToBounds = false
        
        DoneButtonOt.layer.cornerRadius = 9
        DoneButtonOt.layer.shadowColor = UIColor.systemGray4.cgColor
        DoneButtonOt.layer.shadowRadius = 4.0
        DoneButtonOt.layer.shadowOpacity = 4.4
        DoneButtonOt.layer.shadowOffset = CGSize(width: 4, height: 4)
        DoneButtonOt.layer.masksToBounds = false
        
        
    }

    @IBAction func DoneButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "SignInPage") as! SignInPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
