//
//  MessagePage.swift
//  
//
//  Created by r86 on 25/07/23.


import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import SDWebImage
import MessageKit
import InputBarAccessoryView

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
    var userName = ""
    var imageUrl = ""
    var receiverEmail = ""
    var senderImage = ""
    var receiverImage = ""
    
    private let selfSender = Sender(senderId: "1", displayName: "Manthan", photoUrl: "")
    private let senderFriend = Sender(senderId: "2", displayName: "Kirtan", photoUrl: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageArray.append(Message(sender: senderFriend, messageId: "2", sentDate: Date(), kind: .text("How are you ?")))
        
        print(null)
        fir = Firestore.firestore()
        ref = Database.database().reference()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        
        getConversation()
    }
    
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

extension MessagePage : InputBarAccessoryViewDelegate {
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        
        if text.isEmpty {
            
        }
        else {
            
            ref.child("Conversation").child(userUid).childByAutoId().setValue(["Text":text,"Time":Date().formatted(),"Sender":userUid,"Receiver":receiverEmail])
            messageArray.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text(text)))
            messagesCollectionView.reloadData()
            
            inputBar.inputTextView.text = nil
        }
        
    }
    
    func getConversation() {
        
        var conversation = [String:Any]()
        
        ref.child("Conversation").child(userUid).observeSingleEvent(of:.value, with: { [self] (snapShot) in
            if let value = snapShot.children.allObjects as? [DataSnapshot] {
                for directory in value {
                    conversation = directory.value! as! [String :Any]
                    
                    if conversation["Receiver"] as? String == receiverEmail{
                        if let text = conversation["Text"] as? String {
                            print(text)
                            messageArray.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text(text)))
                            messagesCollectionView.reloadData()
                        }
                    }
                    
                }
                
            }
            
        })
        
    }
    
}
