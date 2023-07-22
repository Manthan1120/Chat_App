//
//  E-mailVerifyForOtp.swift
//  Chat_App
//
//  Created by r85 on 21/07/23.
//

import UIKit
import DPOTPView

class E_mailVerifyForOtp: UIViewController {

    @IBOutlet weak var VerifyButton: UIButton!
    @IBOutlet weak var ViewForOt: UIView!
    @IBOutlet weak var OtpViewOt: DPOTPView!
    override func viewDidLoad() {
        super.viewDidLoad()

        AllPageUi()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func AllPageUi(){
        ViewForOt.layer.cornerRadius = 100
        
        VerifyButton.layer.cornerRadius = 9
        VerifyButton.layer.shadowColor = UIColor.systemGray4.cgColor
        VerifyButton.layer.shadowRadius = 4.0
        VerifyButton.layer.shadowOpacity = 4.4
        VerifyButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        VerifyButton.layer.masksToBounds = false
        
        OtpViewOt.layer.cornerRadius = 15
        OtpViewOt.layer.masksToBounds = true
        
    }
    
    @IBAction func SendButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "PasswordChange") as! PasswordChange
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
