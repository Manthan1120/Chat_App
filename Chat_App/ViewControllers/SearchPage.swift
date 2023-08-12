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
    var Email : String
}


class SearchPage: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tabelView: UITableView!
    
    var arrayOfUsersData = [UserData]()
    var nullArr = [UserData]()
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
                    return nil
                }
                nullArr = arrayOfUsersData
                tabelView.reloadData()
                print(arrayOfUsersData)
            }
        }
    }
}

extension SearchPage: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nullArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchTableViewCell
        cell.userNameLabel.text! = nullArr[indexPath.row].Username
        cell.userImage.sd_setImage(with: URL(string: nullArr[indexPath.row].ProfileImageUrl))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "inspactPage") as! inspactPage
        navigationController?.pushViewController(navigation, animated: true)
        navigation.userEmail = nullArr[indexPath.row].Email
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
}

extension SearchPage: UISearchBarDelegate {
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
