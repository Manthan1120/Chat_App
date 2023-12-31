

import UIKit
import FirebaseFirestore
import FirebaseAuth
import SDWebImage

class FeedBackPage: UIViewController {

    @IBOutlet weak var textviewForFeedBack: UITextView!
    @IBOutlet weak var feedbackSendButton: UIButton!
    
    var fir : Firestore!
    var colRef : CollectionReference!
    var userUid = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allUi()
        fir = Firestore.firestore()

    }
    
    func allUi(){
        
        textviewForFeedBack.layer.borderWidth = 1.5
        textviewForFeedBack.layer.cornerRadius = 4
        textviewForFeedBack.layer.borderColor = UIColor.systemGray4.cgColor
        textviewForFeedBack.layer.masksToBounds = true
        
        feedbackSendButton.layer.cornerRadius = 12
        feedbackSendButton.layer.shadowColor = UIColor.systemGray4.cgColor
        feedbackSendButton.layer.shadowRadius = 4.0
        feedbackSendButton.layer.shadowOpacity = 4.4
        feedbackSendButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        feedbackSendButton.layer.masksToBounds = true
        
        
    }
    
    @IBAction func feedBackAction(_ sender: Any) {
        saveData()
    }
    
    @IBAction func showAllFeedBack(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "showFeedBackPage") as! showFeedBackPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func saveData() {
        
       let userUid = Auth.auth().currentUser!.uid
        
        colRef = Firestore.firestore().collection("UserProfile")
        colRef.addSnapshotListener() { [self] (docuSnapshot, error) in
            if let error = error {
                print("something went wrong:\(error)")
            }else{
                for document in docuSnapshot!.documents {
                    if document.documentID == userUid {
                        let directory = ["Feedback":textviewForFeedBack.text! ,"UserUID":userUid,"Username": document["Username"],"ProfileImageUrl":document["ProfileImageUrl"] ]as [String : Any]
                        self.fir.collection("Feedback").document().setData(directory)
                       
                    }
                }
            }
        }
    }
    

}
