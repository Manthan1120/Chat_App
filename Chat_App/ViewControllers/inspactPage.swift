//
//  inspactPage.swift
//  Pods
//
//  Created by r85 on 09/08/23.
//

import UIKit

class inspactPage: UIViewController {

    @IBOutlet weak var uiViewForInspectPage: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addButtonOt: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AllUi()
    }
   func AllUi(){
       img.layer.cornerRadius = 84
       img.layer.masksToBounds = true
       
       uiViewForInspectPage.layer.cornerRadius = 30
       uiViewForInspectPage.layer.shadowColor = UIColor.systemGray3.cgColor
       uiViewForInspectPage.layer.shadowRadius = 8.0
       uiViewForInspectPage.layer.shadowOpacity = 6.0
       uiViewForInspectPage.layer.shadowOffset = CGSize(width: 4, height: 4)
       uiViewForInspectPage.layer.masksToBounds = false
       
       addButtonOt.layer.cornerRadius = 9
       addButtonOt.layer.shadowColor = UIColor.systemGray3.cgColor
       addButtonOt.layer.shadowRadius = 4.0
       addButtonOt.layer.shadowOpacity = 4.4
       addButtonOt.layer.shadowOffset = CGSize(width: 4, height: 4)
       addButtonOt.layer.masksToBounds = false
        
    }
    

    
}
