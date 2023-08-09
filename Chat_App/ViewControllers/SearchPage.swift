//
//  HomePage.swift
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


struct UserData {
    var Username : String
    var ProfileImageUrl : String
}


class SearchPage: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tabelView: UITableView!
    
    var arrayOfUsersData = [UserData]()
    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userImage = ""
    var userUid = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFirData()
        setUI()
        
    }
    
    func setUI(){
        searchTextField.layer.backgroundColor = UIColor.white.cgColor
        searchTextField.layer.cornerRadius = 9
        searchTextField.layer.shadowColor = UIColor.systemGray3.cgColor
        searchTextField.layer.shadowRadius = 4.0
        searchTextField.layer.shadowOpacity = 4.4
        searchTextField.layer.shadowOffset = CGSize(width: 4, height: 4)
        searchTextField.layer.masksToBounds = false
        
        searchButton.layer.backgroundColor = UIColor.white.cgColor
        searchButton.layer.cornerRadius = 9
        searchButton.layer.shadowColor = UIColor.systemGray3.cgColor
        searchButton.layer.shadowRadius = 4.0
        searchButton.layer.shadowOpacity = 4.4
        searchButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        searchButton.layer.masksToBounds = false
    }
    
    func getFirData(){
        
        colRef = Firestore.firestore().collection("UserProfile")
        colRef.addSnapshotListener() { [self] docuSnapshot, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            else{
                arrayOfUsersData = docuSnapshot!.documents.compactMap { document in
                    if document.documentID != userUid! {
                        return UserData(Username: document["Username"] as! String, ProfileImageUrl: document["ProfileImageUrl"] as! String)
                    }
                    return nil
                }
                tabelView.reloadData()
                print(arrayOfUsersData)
            }
        }
    }
}

extension SearchPage: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfUsersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchTableViewCell
        cell.userNameLabel.text! = arrayOfUsersData[indexPath.row].Username
        cell.userImage.sd_setImage(with: URL(string: arrayOfUsersData[indexPath.row].ProfileImageUrl))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
}
