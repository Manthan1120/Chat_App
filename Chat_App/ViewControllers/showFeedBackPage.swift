//
//  showFeedBackPage.swift
//  
//
//  Created by r85 on 21/08/23.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore

struct AllFeedback{
    var feedback : String
}


class showFeedBackPage: UIViewController {

    @IBOutlet weak var tablev: UITableView!
    
    var arrayOfUsersData = [AllFeedback]()
    var colRef : CollectionReference!
    var userUid = Auth.auth().currentUser?.uid

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getFirData(){
        
        colRef = Firestore.firestore().collection("Feedback")
        colRef.addSnapshotListener() { [self] docuSnapshot, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            else{
                arrayOfUsersData = docuSnapshot!.documents.compactMap { document in
                    if document.documentID != userUid! {
                        return AllFeedback(feedback: document["Feedback"] as! String)
                    }
                    print(document.documentID)
                    return nil
                }
                
                tablev.reloadData()
            }
        }
    }
    
    
    
}
extension showFeedBackPage : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablev.dequeueReusableCell(withIdentifier: "cell") as! feedBackTableViewCell
        
        return cell
    }
}

