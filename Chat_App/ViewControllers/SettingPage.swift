//
//  SettingPage.swift
//  Chat_App
//
//  Created by r86 on 19/07/23.
//

import UIKit

class SettingPage: UIViewController {

    @IBOutlet weak var tableViewForSetting: UITableView!
    let ArrayForAllsettingName = ["Edit Account","Country","Notification","Language","Legal/About","Swich Account","Sing Out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
extension SettingPage : UITableViewDelegate,UITableViewDataSource {
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrayForAllsettingName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewForSetting.dequeueReusableCell(withIdentifier: "cell") as! settingPageCell
        cell.LableFOrSetting.text = ArrayForAllsettingName[indexPath.row]
        return cell
    }
    
    
}
                                
