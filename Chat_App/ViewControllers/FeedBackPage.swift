//
//  FeedBackPage.swift
//  Chat_App
//
//  Created by r85 on 19/08/23.
//

import UIKit

class FeedBackPage: UIViewController {

    @IBOutlet weak var FirstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!
    @IBOutlet weak var textviewForFeedBack: UITextView!
    @IBOutlet weak var feedbackSendButton: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allUi()

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
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
