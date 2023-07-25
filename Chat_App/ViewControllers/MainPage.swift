//
//  UserPage.swift
//  Chat_App
//
//  Created by r86 on 19/07/23.
//

import UIKit

class MainPage: UIViewController {

    @IBOutlet weak var searchTextFiled: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tabelView: UITableView!
    
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            
        }
    }
    
    
}
