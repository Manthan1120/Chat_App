//
//  inspactPage.swift
//  Pods
//
//  Created by r85 on 09/08/23.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import SDWebImage

var null = ""

class inspactPage: UIViewController {
    
    @IBOutlet weak var messgaButton: UIButton!
    @IBOutlet weak var uiViewForInspectPage: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderTextFiled: UILabel!
    @IBOutlet weak var bioTextView: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var MoNumber: UILabel!
    
    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userImage = ""
    var userUid = Auth.auth().currentUser?.uid
    var userEmail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fir = Firestore.firestore()
        AllUi()
        getallData()
        userEmail = null
    }
    
    
    func AllUi(){
        bioTextView.layer.borderWidth = 1
        bioTextView.layer.borderColor = UIColor.systemGray6.cgColor
        bioTextView.layer.backgroundColor = UIColor.white.cgColor
        bioTextView.layer.cornerRadius = 12
        bioTextView.layer.masksToBounds = true
        
        birthDate.layer.borderWidth = 1
        birthDate.layer.borderColor = UIColor.systemGray6.cgColor
        birthDate.layer.backgroundColor = UIColor.white.cgColor
        birthDate.layer.cornerRadius = 12
        birthDate.layer.masksToBounds = true
        
        MoNumber.layer.borderWidth = 1
        MoNumber.layer.borderColor = UIColor.systemGray6.cgColor
        MoNumber.layer.backgroundColor = UIColor.white.cgColor
        MoNumber.layer.cornerRadius = 12
        MoNumber.layer.masksToBounds = true
        
        genderTextFiled.layer.borderWidth = 1
        genderTextFiled.layer.borderColor = UIColor.systemGray6.cgColor
        genderTextFiled.layer.backgroundColor = UIColor.white.cgColor
        genderTextFiled.layer.cornerRadius = 12
        genderTextFiled.layer.masksToBounds = true
        
        img.layer.cornerRadius = 84
        img.layer.masksToBounds = true
        
        messgaButton.layer.cornerRadius = 11
        messgaButton.layer.masksToBounds = true
        
        uiViewForInspectPage.layer.cornerRadius = 30
        uiViewForInspectPage.layer.shadowColor = UIColor.systemGray3.cgColor
        uiViewForInspectPage.layer.shadowRadius = 8.0
        uiViewForInspectPage.layer.shadowOpacity = 6.0
        uiViewForInspectPage.layer.shadowOffset = CGSize(width: 4, height: 4)
        uiViewForInspectPage.layer.masksToBounds = false
     
    }
    
    @IBAction func messageButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "MessagePage") as! MessagePage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
 
    
}

extension inspactPage {
    
    func getallData() {
        
        colRef = Firestore.firestore().collection("UserProfile")
        colRef.addSnapshotListener() { [self] (docuSnapshot, error) in
            if let error = error {
                print("something went wrong:\(error)")
            }else{
                for document in docuSnapshot!.documents {
                    if userEmail == document["Email"] as? String {
                        userImage =  document["ProfileImageUrl"] as! String
                        img.sd_setImage(with : URL(string: userImage))
                        bioTextView.text! =  document["Bio"] as! String
                        birthDate.text! = document["BirthDate"] as! String
                        MoNumber.text! = document["Number"] as! String
                        userNameLabel.text! = document["Username"] as! String
                        nameLabel.text! = document["Name"] as! String
                        genderTextFiled.text! = document["Gender"] as! String
                        
                        
                        if userNameLabel.text! == ""{
                            userNameLabel.text! = "Username"
                        }else if nameLabel.text! == ""{
                            nameLabel.text! = "Name"
                        }
                    }
                }
                
                print(userEmail)
            }
        }
        
    }
}
