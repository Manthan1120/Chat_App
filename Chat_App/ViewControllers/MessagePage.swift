
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
    var receiverUid = ""
    
    private let sender = Sender(senderId: "1", displayName: "Manthan", photoUrl: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(null)
        fir = Firestore.firestore()
        ref = Database.database().reference()
        
        self.title = userName
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self

        DispatchQueue.main.async {
            self.messagesCollectionView.reloadData()
        }
        
        messagesCollectionView.scrollToLastItem()
        
        getConversation()
    }
    
    func currentSender() -> MessageKit.SenderType {
        return sender
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
            
            ref.child("Conversation").child(userUid).childByAutoId().setValue(["Text":text,"Time":Date().formatted(),"Receiver":receiverUid])
            
            ref.child("Conversation").child(receiverUid).childByAutoId().setValue(["Text":text,"Time":Date().formatted(),"Sender":userUid])
        
            inputBar.inputTextView.text = nil
        }
        messagesCollectionView.reloadData()
        
    }
    
    func getConversation() {
            
        var conversation = [String:Any]()
        
        ref.child("Conversation").child(userUid).observeSingleEvent(of:.value, with: { [self] (snapShot) in
            messagesCollectionView.reloadData()
            if let value = snapShot.children.allObjects as? [DataSnapshot] {
                for directory in value {
                    conversation = directory.value! as! [String :Any]
                    print(conversation)
                    if let receiver = conversation["Receiver"] as? String {
                        print("Receiver",receiver)
                        if receiver == receiverUid{
                            print("ReceiverUid",receiverUid)
                            if let text = conversation["Text"] as? String {
                                messageArray.append(Message(sender: Sender(senderId: "1", displayName: "Manthan", photoUrl: ""), messageId: "1", sentDate: Date(), kind: .text(text)))
                               
                            }
                        }
                    }
                    else if let sender = conversation["Sender"] as? String {
                        print("Sender",sender)
                        if sender == receiverUid{
                            print("UserUId",userUid)
                            if let text = conversation["Text"] as? String {
                                messageArray.append(Message(sender: Sender(senderId: "2", displayName: "Kirtan", photoUrl: ""), messageId: "2", sentDate: Date(), kind: .text(text)))
                                
                            }
                        }
                    }
                }
                
            }
        })
    }
    
}

