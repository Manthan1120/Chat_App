

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
        set()
    }
    
    func set() {
        twiterOutlate.layer.cornerRadius = 9
        twiterOutlate.layer.shadowColor = UIColor.systemGray3.cgColor
        twiterOutlate.layer.shadowRadius = 4.0
        twiterOutlate.layer.shadowOpacity = 4.4
        twiterOutlate.layer.shadowOffset = CGSize(width: 4, height: 4)
        twiterOutlate.layer.masksToBounds = false
        
        facbookOutlate.layer.cornerRadius = 9
        facbookOutlate.layer.shadowColor = UIColor.systemGray3.cgColor
        facbookOutlate.layer.shadowRadius = 4.0
        facbookOutlate.layer.shadowOpacity = 4.4
        facbookOutlate.layer.shadowOffset = CGSize(width: 4, height: 4)
        facbookOutlate.layer.masksToBounds = false
        
        googleOutlate.layer.cornerRadius = 9
        googleOutlate.layer.shadowColor = UIColor.systemGray3.cgColor
        googleOutlate.layer.shadowRadius = 4.0
        googleOutlate.layer.shadowOpacity = 4.4
        googleOutlate.layer.shadowOffset = CGSize(width: 4, height: 4)
        googleOutlate.layer.masksToBounds = false
        
        singUpButtonOutlate.layer.cornerRadius = 9
        singUpButtonOutlate.layer.shadowColor = UIColor.systemGray3.cgColor
        singUpButtonOutlate.layer.shadowRadius = 4.0
        singUpButtonOutlate.layer.shadowOpacity = 4.4
        singUpButtonOutlate.layer.shadowOffset = CGSize(width: 4, height: 4)
        singUpButtonOutlate.layer.masksToBounds = false
        
        confirmPasswordOutlate.layer.backgroundColor = UIColor.white.cgColor
        confirmPasswordOutlate.layer.cornerRadius = 9
        confirmPasswordOutlate.layer.shadowColor = UIColor.systemGray3.cgColor
        confirmPasswordOutlate.layer.shadowRadius = 4.0
        confirmPasswordOutlate.layer.shadowOpacity = 4.4
        confirmPasswordOutlate.layer.shadowOffset = CGSize(width: 4, height: 4)
        confirmPasswordOutlate.layer.masksToBounds = false
        
        passwordOutlate.layer.backgroundColor = UIColor.white.cgColor
        passwordOutlate.layer.cornerRadius = 9
        passwordOutlate.layer.shadowColor = UIColor.systemGray3.cgColor
        passwordOutlate.layer.shadowRadius = 4.0
        passwordOutlate.layer.shadowOpacity = 4.4
        passwordOutlate.layer.shadowOffset = CGSize(width: 4, height: 4)
        passwordOutlate.layer.masksToBounds = false
        
        emailOutlate.layer.backgroundColor = UIColor.white.cgColor
        emailOutlate.layer.cornerRadius = 9
        emailOutlate.layer.shadowColor = UIColor.systemGray3.cgColor
        emailOutlate.layer.shadowRadius = 4.0
        emailOutlate.layer.shadowOpacity = 4.4
        emailOutlate.layer.shadowOffset = CGSize(width: 4, height: 4)
        emailOutlate.layer.masksToBounds = false
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

