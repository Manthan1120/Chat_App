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

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tabelView: UITableView!
   
    var ref : DatabaseReference!
    var colRef : CollectionReference!
    var fir : Firestore!
    var userUid = Auth.auth().currentUser?.uid
    var userImage = ""
    var arrayOfFriendList = [FriendList]()
    var nullArr = [FriendList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        getFirData()
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
                nullArr = arrayOfFriendList
                tabelView.reloadData()
                print(">>>>>>>>>")
                print(arrayOfFriendList)
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
        cell.ProfileImage.sd_setImage(with: URL(string: nullArr[indexPath.row].UserImage))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "MessagePage") as! MessagePage
        navigationController?.pushViewController(navigation, animated: true)
        print(nullArr[indexPath.row].Username)
        navigation.userNameForUserLabel = nullArr[indexPath.row].Username
        navigation.userImage = nullArr[indexPath.row].UserImage
    }
    
}

extension MainPage: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text!.isEmpty{
            nullArr = arrayOfFriendList
            print(nullArr)
        }else{
            nullArr = arrayOfFriendList.filter{$0.Username.hasPrefix(searchBar.text!)}
            print(nullArr)
        }
        tabelView.reloadData()
    }
    
}
