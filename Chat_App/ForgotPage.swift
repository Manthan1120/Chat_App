//
//  ForgotPage.swift
//  Chat_App
//
//  Created by r85 on 20/07/23.
//

import UIKit

class ForgotPage: UIViewController {

    @IBOutlet weak var TextFieldeOt: UITextField!
    @IBOutlet weak var SendButtonOt: UIButton!
    @IBOutlet weak var LockScrenBcViewOt: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        allUi()
        // Do any additional setup after loading the view.
    }
    

        func allUi() {
            LockScrenBcViewOt.layer.cornerRadius = 100
            
            TextFieldeOt.layer.backgroundColor = UIColor.white.cgColor
            TextFieldeOt.layer.cornerRadius = 9
            TextFieldeOt.layer.shadowColor = UIColor.systemGray3.cgColor
            TextFieldeOt.layer.shadowRadius = 4.0
            TextFieldeOt.layer.shadowOpacity = 4.4
            TextFieldeOt.layer.shadowOffset = CGSize(width: 4, height: 4)
            TextFieldeOt.layer.masksToBounds = false
            
            SendButtonOt.layer.cornerRadius = 9
            SendButtonOt.layer.shadowColor = UIColor.systemGray3.cgColor
            SendButtonOt.layer.shadowRadius = 4.0
            SendButtonOt.layer.shadowOpacity = 4.4
            SendButtonOt.layer.shadowOffset = CGSize(width: 4, height: 4)
            SendButtonOt.layer.masksToBounds = false
            
        }

       

    }



