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

struct Sender : SenderType {
    var senderId: String
    var displayName: String
    var photoUrl: String
}

struct Message : MessageType{
    var sender: MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
}

class MessagePage: MessagesViewController,MessagesDataSource,MessagesLayoutDelegate,MessagesDisplayDelegate {

    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userUid = Auth.auth().currentUser!.uid
    var messageArray = [MessageType]()
    private let selfSender = Sender(senderId: "1", displayName: "Manthan", photoUrl: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        messageArray.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("Hii World")))
        
        print(messageArray)
        
    }
    
//    func getConversation() {
//        fir.collection("Conversation").document("\(userUid)").setData("":"")
//    }
    
    
    func currentSender() -> MessageKit.SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messageArray[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messageArray.count
    }
    
}
