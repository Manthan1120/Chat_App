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

struct UserData {
    var Username : String
    var ProfileImageUrl : String
    var Email : String
}

class MainPage: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tabelView: UITableView!
   
    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userUid = Auth.auth().currentUser?.uid
    var userImage = ""
    var arrayOfUsersData = [UserData]()
    var nullArr = [UserData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        getFirData()
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
                        return UserData(Username: document["Username"] as! String, ProfileImageUrl: document["ProfileImageUrl"] as! String, Email: document["Email"] as! String)
                    }
                    print(document.documentID)
                    return nil
                }
                nullArr = arrayOfUsersData
                tabelView.reloadData()
            }
        }
    }
    
}

extension MainPage: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nullArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellForUserFriendDetail
        cell.ProfileImage.layer.cornerRadius = 27
        cell.UserName.text! = nullArr[indexPath.row].Username
        cell.ProfileImage.sd_setImage(with: URL(string: nullArr[indexPath.row].ProfileImageUrl))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "MessagePage") as! MessagePage
        navigationController?.pushViewController(navigation, animated: true)
        navigation.userName = nullArr[indexPath.row].Username
        navigation.imageUrl = nullArr[indexPath.row].ProfileImageUrl
    }
    
}

extension MainPage: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text!.isEmpty{
            nullArr = arrayOfUsersData
            print(nullArr)
        }else{
            nullArr = arrayOfUsersData.filter{$0.Username.hasPrefix(searchBar.text!)}
            print(nullArr)
        }
        tabelView.reloadData()
    }
    
}
