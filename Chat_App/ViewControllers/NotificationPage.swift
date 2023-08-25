//
//  NotificationPage.swift
//  
//
//  Created by r85 on 21/08/23.
//

import UIKit

class NotificationPage: UIViewController {

    @IBOutlet weak var notificationButton: UIButton!
    
    @IBOutlet weak var swichbutton: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationButton.layer.backgroundColor = UIColor.white.cgColor
        notificationButton.layer.cornerRadius = 9
        notificationButton.layer.shadowColor = UIColor.systemGray4.cgColor
        notificationButton.layer.shadowRadius = 4.0
        notificationButton.layer.shadowOpacity = 4.4
        notificationButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        notificationButton.layer.masksToBounds = false

    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swichButton(_ sender: Any) {
        HapticManager.shared.vibrate(for: .success)
    }
    

}
