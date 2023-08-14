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

struct FriendList {
    var Username : String
    var UserImage : String
    var UserEmail : String
}

class MainPage: UIViewController {

    @IBOutlet weak var searchTextFiled: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tabelView: UITableView!
   
    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userUid = Auth.auth().currentUser?.uid
    var userImage = ""
    var arrayOfFriendList = [FriendList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        getFirData()
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

    func getFirData(){
        
        colRef = Firestore.firestore().collection(Auth.auth().currentUser!.uid)
        colRef.addSnapshotListener() { [self] docuSnapshot, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            else{
                arrayOfFriendList = docuSnapshot!.documents.compactMap { document in
                    return FriendList(Username: document["Username"] as! String,UserImage: document["UserImage"] as! String,UserEmail:document["UserEmail"] as! String)
                }
                tabelView.reloadData()
                print(">>>>>>>>>")
                print(arrayOfFriendList)
            }
        }
    }
    
}


extension MainPage: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfFriendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellForUserFriendDetail
        cell.ProfileImage.layer.cornerRadius = 27
        cell.UserName.text! = arrayOfFriendList[indexPath.row].Username
        cell.ProfileImage.sd_setImage(with: URL(string: arrayOfFriendList[indexPath.row].UserImage))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let navigation = storyboard?.instantiateViewController(withIdentifier: "MessagePage") as! MessagePage
            navigationController?.pushViewController(navigation, animated: true)
            
        }
    }
    
    
}
