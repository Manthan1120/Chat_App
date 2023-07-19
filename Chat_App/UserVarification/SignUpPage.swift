

import UIKit

class SignUpPage: UIViewController {
    
    @IBOutlet weak var emailOutlate: UITextField!
    @IBOutlet weak var passwordOutlate:UITextField!
    @IBOutlet weak var confirmPasswordOutlate: UITextField!
    @IBOutlet weak var singUpButtonOutlate: UIButton!
    @IBOutlet weak var googleOutlate: UIButton!
    @IBOutlet weak var facbookOutlate: UIButton!
    @IBOutlet weak var twiterOutlate: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "TabBar") as! TabBar
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func googleButtonAction(_ sender: Any) {
    }
    
    @IBAction func facbookButtonAction(_ sender: Any) {
    }
    @IBAction func twiterButtonAction(_ sender: Any) {
    }
    
}

