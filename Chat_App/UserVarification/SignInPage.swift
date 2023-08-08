

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore
import FBSDKCoreKit




class SignInPage: UIViewController {
   
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var signInButtonOutlet: UIButton!
    @IBOutlet weak var googleButtonOutlet: UIButton!
    @IBOutlet weak var twitterButtonOutlet: UIButton!
    
    
    
    var fir: Firestore!
    var userUID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        set()
        fir = Firestore.firestore()
        
        
        
    }
    
    @IBAction func skipButton(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TabBar
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func set() {
        twitterButtonOutlet.layer.cornerRadius = 9
        twitterButtonOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        twitterButtonOutlet.layer.shadowRadius = 4.0
        twitterButtonOutlet.layer.shadowOpacity = 4.4
        twitterButtonOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        twitterButtonOutlet.layer.masksToBounds = false
        
//        faceBookButtonOutlet.layer.cornerRadius = 9
//        faceBookButtonOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
//        faceBookButtonOutlet.layer.shadowRadius = 4.0
//        faceBookButtonOutlet.layer.shadowOpacity = 4.4
//        faceBookButtonOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
//        faceBookButtonOutlet.layer.masksToBounds = false
        
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
    
    func fireBaseAuth() {
        Auth.auth().signIn(withEmail: emailOutlet.text!, password: passwordOutlet.text!) {[self] user, error in
            if error == nil {
                userUID = user!.user.uid
                print(userUID)
                navigation()
                emailOutlet.text = ""
                passwordOutlet.text = ""
            }else{
                print(error!.localizedDescription)
                showAlert(title: error!.localizedDescription)
            }
        }
        
    }
    
    func fetchData(){
        
    }
    
    func navigation() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TabBar
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func showAlert(title:String) {
        let alert = UIAlertController(title: "Error!!", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        present(alert, animated:true, completion: nil)
    }
    
    @IBAction func twitterButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func googleButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func facebookButtonAction(_ sender: Any) {
      
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
       fireBaseAuth()
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "SignUpPage") as! SignUpPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func ForGotPage(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ForgotPage") as! ForgotPage
        navigationController?.pushViewController(navigation, animated: true)
    }
   
    
}

