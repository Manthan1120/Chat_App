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

class inspactPage: UIViewController {

    @IBOutlet weak var uiViewForInspectPage: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addButtonOt: UIButton!
    @IBOutlet weak var genderTextFiled: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    
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
    }
    
   func AllUi(){
       img.layer.cornerRadius = 84
       img.layer.masksToBounds = true
       
       uiViewForInspectPage.layer.cornerRadius = 30
       uiViewForInspectPage.layer.shadowColor = UIColor.systemGray3.cgColor
       uiViewForInspectPage.layer.shadowRadius = 8.0
       uiViewForInspectPage.layer.shadowOpacity = 6.0
       uiViewForInspectPage.layer.shadowOffset = CGSize(width: 4, height: 4)
       uiViewForInspectPage.layer.masksToBounds = false
       
       addButtonOt.layer.cornerRadius = 9
       addButtonOt.layer.shadowColor = UIColor.systemGray3.cgColor
       addButtonOt.layer.shadowRadius = 4.0
       addButtonOt.layer.shadowOpacity = 4.4
       addButtonOt.layer.shadowOffset = CGSize(width: 4, height: 4)
       addButtonOt.layer.masksToBounds = false
        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "SearchPage") as! SearchPage
        navigationController?.popViewController(animated: true)
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
