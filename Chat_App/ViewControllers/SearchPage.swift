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

class SearchPage: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tabelView: UITableView!
    
    var arrayOfUsers : Array<String>!
    var arrayOfUserImage : Array<String>!
    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userImage = ""
    var userUid = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFirData()
        
    }

    func getFirData(){
        arrayOfUsers = []
        arrayOfUserImage = []
        colRef = Firestore.firestore().collection("UserProfile")
        colRef.addSnapshotListener() { [self] (docuSnapshot, error) in
            if let error = error {
                print("something went wrong:\(error)")
            }else{
                for document in docuSnapshot!.documents {
                    self.arrayOfUsers.append(document["Username"] as! String)
                    self.arrayOfUserImage.append(document["ProfileImageUrl"]as! String)
                }
                print(arrayOfUsers!)
                print(arrayOfUserImage!)
            }
        }
    }
}

extension SearchPage: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchTableViewCell
        cell.userNameLabel.text! = arrayOfUsers[indexPath.row]
        cell.userImage.sd_setImage(with: URL(string: arrayOfUserImage[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
