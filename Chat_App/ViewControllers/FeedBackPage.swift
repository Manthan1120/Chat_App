//
//  FeedBackPage.swift
//  Chat_App
//
//  Created by r85 on 19/08/23.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth


class FeedBackPage: UIViewController {

    @IBOutlet weak var FirstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!
    @IBOutlet weak var textviewForFeedBack: UITextView!
    @IBOutlet weak var feedbackSendButton: UIButton!
    
    var fir : Firestore!
    
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
        let directory = ["Feedback":textviewForFeedBack.text] as! [String : Any]
        self.fir.collection("Feedback").document(Auth.auth().currentUser!.uid).setData(directory)
    }
    

}
