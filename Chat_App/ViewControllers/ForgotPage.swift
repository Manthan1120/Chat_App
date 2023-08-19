//
//  ForgotPage.swift
//  Chat_App
//
//  Created by r85 on 20/07/23
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore

class ForgotPage: UIViewController {
    
    var fir: Firestore!

    @IBOutlet weak var TextFieldeOt: UITextField!
    @IBOutlet weak var SendButtonOt: UIButton!
    @IBOutlet weak var LockScrenBcViewOt: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allUi()
        fir = Firestore.firestore()
    }
    
    func allUi() {
        
        LockScrenBcViewOt.layer.cornerRadius = 100
        
        TextFieldeOt.layer.backgroundColor = UIColor.white.cgColor
        TextFieldeOt.layer.cornerRadius = 9
        TextFieldeOt.layer.shadowColor = UIColor.systemGray4.cgColor
        TextFieldeOt.layer.shadowRadius = 4.0
        TextFieldeOt.layer.shadowOpacity = 4.4
        TextFieldeOt.layer.shadowOffset = CGSize(width: 4, height: 4)
        TextFieldeOt.layer.masksToBounds = false
        
        SendButtonOt.layer.cornerRadius = 9
        SendButtonOt.layer.shadowColor = UIColor.systemGray4.cgColor
        SendButtonOt.layer.shadowRadius = 4.0
        SendButtonOt.layer.shadowOpacity = 4.4
        SendButtonOt.layer.shadowOffset = CGSize(width: 4, height: 4)
        SendButtonOt.layer.masksToBounds = false
        
    }
    
    func sendOTP() {
        
    }

    func showAlert(title:String) {
        let alert = UIAlertController(title: "Error!!", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        present(alert, animated:true, completion: nil)
    }

    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func SendButtonAction(_ sender: Any) {
        sendOTP()
        navigation()
    }
    
    func navigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "E_mailVerifyForOtp") as! E_mailVerifyForOtp
        navigationController?.pushViewController(navigation, animated: true)
        let email = TextFieldeOt.text
        navigation.email = email!
    }
    
}



