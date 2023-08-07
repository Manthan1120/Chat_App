//

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

class MainPage: UIViewController {

    @IBOutlet weak var searchTextFiled: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tabelView: UITableView!
    
    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userUid = Auth.auth().currentUser?.uid
    var userImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        
        searchTextFiled.layer.backgroundColor = UIColor.white.cgColor
        searchTextFiled.layer.cornerRadius = 9
        searchTextFiled.layer.shadowColor = UIColor.systemGray3.cgColor
        searchTextFiled.layer.shadowRadius = 4.0
        searchTextFiled.layer.shadowOpacity = 4.4
        searchTextFiled.layer.shadowOffset = CGSize(width: 4, height: 4)
        searchTextFiled.layer.masksToBounds = false
        
        searchButton.layer.backgroundColor = UIColor.white.cgColor
        searchButton.layer.cornerRadius = 9
        searchButton.layer.shadowColor = UIColor.systemGray3.cgColor
        searchButton.layer.shadowRadius = 4.0
        searchButton.layer.shadowOpacity = 4.4
        searchButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        searchButton.layer.masksToBounds = false
    }

}


extension MainPage: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellForUserFriendDetail
        cell.ProfileImage.layer.cornerRadius = 15
        cell.ProfileImage.layer.borderWidth = 3
        cell.ProfileImage.layer.borderColor = UIColor.systemGray4.cgColor
        
        
        colRef = Firestore.firestore().collection("UserProfile")
        colRef.getDocuments() { [self] (docuSnapshot, error) in
            if let error = error {
                print("something went wrong:\(error)")
            }else{
                for document in docuSnapshot!.documents {
                    if document.documentID == userUid {
                        userImage =  document["ProfileImageUrl"] as! String
                        cell.ProfileImage.sd_setImage(with : URL(string: userImage))
                        print(userImage)
                    }
                }
            }
        }
        
        colRef = Firestore.firestore().collection("UserData")
        colRef.getDocuments() { [self] (docuSnapshot, error) in
            if let error = error {
                print("something went wrong:\(error)")
            }else{
                for document in docuSnapshot!.documents {
                    if document.documentID == userUid {
                        cell.UserName.text! = document["Name"] as! String
                    }
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let navigation = storyboard?.instantiateViewController(withIdentifier: "MessagePage") as! MessagePage
            navigationController?.pushViewController(navigation, animated: true)
            
        }
    }
    
    
}
