

import UIKit

class SignInPage: UIViewController {
   
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var signInButtonOutlet: UIButton!
    @IBOutlet weak var googleButtonOutlet: UIButton!
    @IBOutlet weak var faceBookButtonOutlet: UIButton!
    @IBOutlet weak var twitterButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
    }
    
    func set() {
        twitterButtonOutlet.layer.cornerRadius = 9
        twitterButtonOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        twitterButtonOutlet.layer.shadowRadius = 4.0
        twitterButtonOutlet.layer.shadowOpacity = 4.4
        twitterButtonOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        twitterButtonOutlet.layer.masksToBounds = false
        faceBookButtonOutlet.layer.cornerRadius = 9
        faceBookButtonOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        faceBookButtonOutlet.layer.shadowRadius = 4.0
        faceBookButtonOutlet.layer.shadowOpacity = 4.4
        faceBookButtonOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        faceBookButtonOutlet.layer.masksToBounds = false
        googleButtonOutlet.layer.cornerRadius = 9
        googleButtonOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        googleButtonOutlet.layer.shadowRadius = 4.0
        googleButtonOutlet.layer.shadowOpacity = 4.4
        googleButtonOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        googleButtonOutlet.layer.masksToBounds = false
        signInButtonOutlet.layer.cornerRadius = 9
        signInButtonOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        signInButtonOutlet.layer.shadowRadius = 4.0
        signInButtonOutlet.layer.shadowOpacity = 4.4
        signInButtonOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        signInButtonOutlet.layer.masksToBounds = false
        emailOutlet.layer.backgroundColor = UIColor.white.cgColor
        emailOutlet.layer.cornerRadius = 9
        emailOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        emailOutlet.layer.shadowRadius = 4.0
        emailOutlet.layer.shadowOpacity = 4.4
        emailOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        emailOutlet.layer.masksToBounds = false
        passwordOutlet.layer.backgroundColor = UIColor.white.cgColor
        passwordOutlet.layer.cornerRadius = 9
        passwordOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        passwordOutlet.layer.shadowRadius = 4.0
        passwordOutlet.layer.shadowOpacity = 4.4
        passwordOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        passwordOutlet.layer.masksToBounds = false
    }
    
    
    @IBAction func twitterButtonAction(_ sender: Any) {
        
    }
    @IBAction func googleButtonAction(_ sender: Any) {
        
    }
    @IBAction func facebookButtonAction(_ sender: Any) {
        
    }
    @IBAction func signInButtonAction(_ sender: Any) {
        
    }
}
