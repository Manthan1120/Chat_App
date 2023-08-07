//
//  SearchPage.swift
//  Chat_App
//
//  Created by r86 on 19/07/23.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import SDWebImage


class ProfilePage: UIViewController {
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var genderLabelOutlet: UILabel!
    @IBOutlet weak var numberLabelOutlet: UILabel!
    @IBOutlet weak var birthDateLabelOutlet: UILabel!
    @IBOutlet weak var bioLabelOutlet: UILabel!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var userNameLabelOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userImage = ""
    
    let imagePicker = UIImagePickerController()
    var userUid = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Done!!")
        print(userUid!)
        getAllFireData()
        set()
        fir = Firestore.firestore()
        
    }
   
    func set() {
        
        imageOutlet.layer.cornerRadius = 45
        imageOutlet.layer.masksToBounds = true
        
        editButton.layer.cornerRadius = 27
        editButton.layer.masksToBounds = true
        
        bioLabelOutlet.layer.cornerRadius = 7
        bioLabelOutlet.layer.masksToBounds = true
        
        birthDateLabelOutlet.layer.cornerRadius = 7
        birthDateLabelOutlet.layer.masksToBounds = true
        
        numberLabelOutlet.layer.cornerRadius = 7
        numberLabelOutlet.layer.masksToBounds = true
        
        genderLabelOutlet.layer.cornerRadius = 7
        genderLabelOutlet.layer.masksToBounds = true
        
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "EditProfilePage") as! EditProfilePage
        navigationController?.pushViewController(navigation, animated: true)
    }
}
extension ProfilePage {
    
    func getAllFireData() {
        print(">>>>>")
        
        // realtime get all data
        //        ref = Database.database().reference()
        //        ref.observeSingleEvent(of: .value) { snapshot in
        //            print(snapshot.value!)
        //        }
        
        colRef = Firestore.firestore().collection("UserProfile")
        colRef.addSnapshotListener() { [self] (docuSnapshot, error) in
            if let error = error {
                print("something went wrong:\(error)")
            }else{
                for document in docuSnapshot!.documents {
                    if document.documentID == userUid {
                        userImage =  document["ProfileImageUrl"] as! String
                        imageOutlet.sd_setImage(with : URL(string: userImage))
                        print(userImage)
                    }
                }
            }
        }
        
        colRef = Firestore.firestore().collection("UserData")
        colRef.addSnapshotListener() { [self] (docuSnapshot, error) in
            if let error = error {
                print("something went wrong:\(error)")
            }else{
                for document in docuSnapshot!.documents {
                    if document.documentID == userUid {
                        bioLabelOutlet.text! =  document["Bio"] as! String
                        numberLabelOutlet.text! = document["Number"] as! String
                        userNameLabelOutlet.text! = document["Username"] as! String
                        nameLabelOutlet.text! = document["Name"] as! String
                        genderLabelOutlet.text! = document["Gender"] as! String
                    }
                }
            }
        }
        
        colRef = Firestore.firestore().collection("User")
        colRef.getDocuments() { [self] (docuSnapshot, error) in
            if let error = error {
                print("something went wrong:\(error)")
            }else{
                for document in docuSnapshot!.documents {
                    if document.documentID == userUid {
                        userNameLabelOutlet.text! =  document["userName"] as! String
                    }
                }
            }
        }
    }
}
