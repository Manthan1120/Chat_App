//
//  SearchPage.swift
//  Chat_App
//
//  Created by r86 on 19/07/23.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage


class ProfilePage: UIViewController {

   
    @IBOutlet weak var editButtonOutlet: UIButton!
    @IBOutlet weak var genderLabelOutlet: UILabel!
    @IBOutlet weak var numberLabelOutlet: UILabel!
    @IBOutlet weak var birthDateLabelOutlet: UILabel!
    @IBOutlet weak var bioLabelOutlet: UILabel!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var userNameLabelOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self,action:
                                #selector(ProfilePage.openGallary(tapGesture:)))
        imageOutlet.isUserInteractionEnabled = true
        imageOutlet.addGestureRecognizer(tapGesture)
    }
    
    @objc func openGallary(tapGesture:UITapGestureRecognizer) {
        self.setUpImagePicker()
    }
    
    
    
    func set() {
       
        imageOutlet.layer.cornerRadius = 45
        imageOutlet.layer.masksToBounds = true
        
        bioLabelOutlet.layer.cornerRadius = 7
        bioLabelOutlet.layer.masksToBounds = true
        
        birthDateLabelOutlet.layer.cornerRadius = 7
        birthDateLabelOutlet.layer.masksToBounds = true
        
        numberLabelOutlet.layer.cornerRadius = 7
        numberLabelOutlet.layer.masksToBounds = true
        
        genderLabelOutlet.layer.cornerRadius = 7
        genderLabelOutlet.layer.masksToBounds = true
        
        editButtonOutlet.layer.cornerRadius = 11
        editButtonOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        editButtonOutlet.layer.shadowRadius = 4.0
        editButtonOutlet.layer.shadowOpacity = 4.4
        editButtonOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        editButtonOutlet.layer.masksToBounds = false
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "EditableSetinPage") as! EditableSetinPage
        navigationController?.pushViewController(navigate, animated: true)
    }
    
}

extension ProfilePage: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
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

extension ProfilePage {
    
    
    func uplodeImage(_ image:UIImage,complition:@escaping((_ url:URL?)->())){
        let storageRef = Storage.storage().reference().child("UserImages.png")
    }
}


