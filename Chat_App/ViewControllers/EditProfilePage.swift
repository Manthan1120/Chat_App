//
//  EditProfilePage.swift
//  
//
//  Created by r86 on 07/08/23.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import SDWebImage
import iOSDropDown

class EditProfilePage: UIViewController {

    @IBOutlet weak var genderTextFiled: DropDown!
    @IBOutlet weak var numberTextFiled: UITextField!
    @IBOutlet weak var bioTextFiled: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usertextField: UITextField!
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    
    let imagePicker = UIImagePickerController()
    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userImage = ""
    var userUid = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allUI()
        fir = Firestore.firestore()
    }
    func allUI() {
        
        doneButton.layer.cornerRadius = 9
        doneButton.layer.shadowColor = UIColor.systemGray3.cgColor
        doneButton.layer.shadowRadius = 4.0
        doneButton.layer.shadowOpacity = 4.4
        doneButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        doneButton.layer.masksToBounds = false
        
        imageOutlet.layer.cornerRadius = 45
        imageOutlet.layer.masksToBounds = true
        
        genderTextFiled.optionArray = ["  male","  Female"]
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self,action:
                                #selector(EditProfilePage.openGallary(tapGesture:)))
        imageOutlet.isUserInteractionEnabled = true
        imageOutlet.addGestureRecognizer(tapGesture)
        
        getallData()
        
        usertextField.layer.cornerRadius = 12
        usertextField.layer.masksToBounds = true
        
        nameTextField.layer.cornerRadius = 12
        nameTextField.layer.masksToBounds = true
        
        bioTextFiled.layer.cornerRadius = 12
        bioTextFiled.layer.masksToBounds = true
        
        birthDateTextField.layer.cornerRadius = 12
        birthDateTextField.layer.masksToBounds = true
        
        numberTextFiled.layer.cornerRadius = 12
        numberTextFiled.layer.masksToBounds = true
        
        genderTextFiled.layer.cornerRadius = 12
        genderTextFiled.layer.masksToBounds = true
         
    }
    
    @objc func openGallary(tapGesture:UITapGestureRecognizer) {
        self.setUpImagePicker()
    }
    
    func saveFirData() {
        self.uplodeImage(self.imageOutlet.image!) { url in
            self.saveImage(profileImageUrl: url!) { success in
                if success != nil {
                    print("Yehh")
                }
            }
        }
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        saveFirData()
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ProfilePage") as! ProfilePage
        navigationController?.popViewController(animated: true)
    }
}

extension EditProfilePage: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func setUpImagePicker() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.delegate = self
            imagePicker.isEditing = true
            self.present(imagePicker, animated: true,completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageOutlet.image = image
        self.dismiss(animated: true,completion: nil)
    }
}

extension EditProfilePage {
    
    func uplodeImage(_ image:UIImage,complition:@escaping((_ url:URL?)->())){
        let storageRef = Storage.storage().reference().child("UserImages.png")
        let imageData = imageOutlet.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        
        storageRef.putData(imageData!,metadata: metaData) { metaData, error in
            if error == nil{
                print("Success")
                storageRef.downloadURL { url, error in
                    complition(url)
                }
            }
            else{
                print("Error !")
            }
        }
    }
    
    func saveImage(profileImageUrl:URL,complition:@escaping((_ url:URL?)->())){
        let directory = ["BirthDate":birthDateTextField.text!,"Username":usertextField.text!,"Name":nameTextField.text!,"Bio":bioTextFiled.text!,"Number":numberTextFiled.text!,"Gender":genderTextFiled.text!,"Email": Auth.auth().currentUser?.email,"ProfileImageUrl":profileImageUrl.absoluteString] as! [String: Any]
        //self.ref.child("UserProfile").child((userUid!)).setValue(directory)
        self.fir.collection("UserProfile").document(userUid!).setData(directory)
    
    }
    
    func getallData() {
        
        colRef = Firestore.firestore().collection("UserProfile")
        colRef.addSnapshotListener() { [self] (docuSnapshot, error) in
            if let error = error {
                print("something went wrong:\(error)")
            }else{
                for document in docuSnapshot!.documents {
                    if document.documentID == userUid {
                        userImage =  document["ProfileImageUrl"] as! String
                        imageOutlet.sd_setImage(with : URL(string: userImage))
                        bioTextFiled.text! =  document["Bio"] as! String
                        numberTextFiled.text! = document["Number"] as! String
                        usertextField.text! = document["Username"] as! String
                        nameTextField.text! = document["Name"] as! String
                        genderTextFiled.text! = document["Gender"] as! String
                        
                        if usertextField.text! == ""{
                            usertextField.text! = "Username"
                        }else if nameTextField.text! == ""{
                            nameTextField.text! = "Name"
                        }
                    }
                }
            }
        }
    }
}
