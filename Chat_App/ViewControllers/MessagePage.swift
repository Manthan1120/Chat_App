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
import MessageKit

class MessagePage: MessagesViewController {
    
    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userUid = Auth.auth().currentUser?.uid
    var userImage = ""
    var userNameForUserLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
