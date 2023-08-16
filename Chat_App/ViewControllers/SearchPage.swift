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
        fir = Firestore.firestore()
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
        cell.addButton.tag = indexPath.row
        cell.addButton.addTarget(self, action: #selector(addToButton), for: .touchUpInside)
     
        
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
    
    @objc func addToButton(sender: UIButton) {
        
        let indexPathForData = IndexPath(row: sender.tag, section: 0)
        let directory  = ["Username":nullArr[indexPathForData.row].Username,"UserImage":nullArr[indexPathForData.row].ProfileImageUrl,"UserEmail":nullArr[indexPathForData.row].Email,"AddOrNot":"https://firebasestorage.googleapis.com/v0/b/chatbuddy-d0c0a.appspot.com/o/UserImages.png?alt=media&token=3a74c78d-84c4-4229-bd55-949ced1e28e4"] as [String : Any]
        self.fir.collection("\(Auth.auth().currentUser!.uid)").document("\(nullArr[indexPathForData.row].Email)").setData(directory)
    
    }
    
}

extension SearchPage: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text!.isEmpty{
            nullArr = arrayOfUsersData
        }else{
            nullArr = arrayOfUsersData.filter{$0.Username.hasPrefix(searchBar.text!)}
        }
        tabelView.reloadData()
    }
    
}
