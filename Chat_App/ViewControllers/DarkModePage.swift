//
//  DarkModePage.swift
//  Chat_App
//
//  Created by r85 on 05/09/23.
//

import UIKit

class DarkModePage: UIViewController {

    @IBOutlet weak var darkModeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        darkModeButton.layer.backgroundColor = UIColor.white.cgColor
        darkModeButton.layer.cornerRadius = 9
        darkModeButton.layer.shadowColor = UIColor.systemGray4.cgColor
        darkModeButton.layer.shadowRadius = 4.0
        darkModeButton.layer.shadowOpacity = 4.4
        darkModeButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        darkModeButton.layer.masksToBounds = false

    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    

}
