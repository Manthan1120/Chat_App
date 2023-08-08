//
//  MessagePage.swift
//  
//
//  Created by r86 on 25/07/23.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import SDWebImage

class MessagePage: UIViewController {

    @IBOutlet weak var sendButtonOtlet: UIButton!
    @IBOutlet weak var textFiledForUser: UITextField!
    @IBOutlet weak var MassegeUserImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userUid = Auth.auth().currentUser?.uid
    var userImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Allui()
        
    }
    
    @IBAction func CloseButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func Allui() {
        MassegeUserImage.layer.cornerRadius = 27
        MassegeUserImage.layer.masksToBounds = true
        
        sendButtonOtlet.layer.cornerRadius = 15
        sendButtonOtlet.layer.shadowColor = UIColor.systemGray3.cgColor
        sendButtonOtlet.layer.shadowRadius = 4.0
        sendButtonOtlet.layer.shadowOpacity = 4.4
        sendButtonOtlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        sendButtonOtlet.layer.masksToBounds = false
        
        textFiledForUser.layer.cornerRadius = 15
        textFiledForUser.layer.shadowColor = UIColor.systemGray3.cgColor
        textFiledForUser.layer.shadowRadius = 4.0
        textFiledForUser.layer.shadowOpacity = 4.4
        textFiledForUser.layer.shadowOffset = CGSize(width: 4, height: 4)
        textFiledForUser.layer.masksToBounds = false
    }
}
