

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FBSDKLoginKit


var id = 1


class SignInPage: UIViewController {
    
    
    
    
   
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var signInButtonOutlet: UIButton!
    @IBOutlet weak var googleButtonOutlet: GIDSignInButton!
    @IBOutlet weak var twitterButtonOutlet: UIButton!
    @IBOutlet weak var faceBookButtonOutlet: FBLoginButton!
    
    
    var fir: Firestore!
    var userUID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        set()
        fir = Firestore.firestore()
        
        if let token = AccessToken.current,
                !token.isExpired {
                // User is logged in, do work such as go to next view controller.
            let token = token.tokenString
            
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
            request.start{(connection,result,error) in
                print("\(result)")
                
            }
        }else {
            faceBookButtonOutlet.permissions = ["public_profile", "email"]
            faceBookButtonOutlet.delegate = self

        }
        print("__----------__")
       print(id)
        
    }
    
    
    @IBAction func skipButton(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TabBar
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func GoogleClicked(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
          guard error == nil else {
              return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
            return
          }
            
          let credential = GoogleAuthProvider.credential(withIDToken: idToken,accessToken: user.accessToken.tokenString)
        }
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
        GoogleClicked()
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

extension SignInPage : LoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginKit.FBLoginButton, didCompleteWith result: FBSDKLoginKit.LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
        request.start{(connection,result,error) in
            print("\(result)")
            
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
        print("log out")

    }
    
    
    
    
}
    
    

