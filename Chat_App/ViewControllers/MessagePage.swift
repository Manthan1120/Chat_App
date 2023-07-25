//
//  MessagePage.swift
//  
//
//  Created by r86 on 25/07/23.
//

import UIKit

class MessagePage: UIViewController {

    @IBOutlet weak var MassegeUserImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Allui()
        
    }
    
    @IBAction func CloseButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func Allui() {
        MassegeUserImage.layer.cornerRadius = 20
    }

   

}
