//
//  PhoneNumberVerification.swift
//  Chat_App
//
//  Created by r85 on 02/09/23.
//

import UIKit

class PhoneNumberVerification: UIViewController {

    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var sendOtpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allAnimaton()
    }
    
    func allAnimaton(){
        mobileView.layer.cornerRadius = 110
        mobileView.layer.masksToBounds = true
        
        mobileNumberTextField.layer.backgroundColor = UIColor.white.cgColor
        mobileNumberTextField.layer.cornerRadius = 9
        mobileNumberTextField.layer.shadowColor = UIColor.systemGray4.cgColor
        mobileNumberTextField.layer.shadowRadius = 4.0
        mobileNumberTextField.layer.shadowOpacity = 4.4
        mobileNumberTextField.layer.shadowOffset = CGSize(width: 4, height: 4)
        mobileNumberTextField.layer.masksToBounds = false
        
        sendOtpButton.layer.cornerRadius = 9
        sendOtpButton.layer.shadowColor = UIColor.systemGray4.cgColor
        sendOtpButton.layer.shadowRadius = 4.0
        sendOtpButton.layer.shadowOpacity = 4.4
        sendOtpButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        sendOtpButton.layer.masksToBounds = false
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
