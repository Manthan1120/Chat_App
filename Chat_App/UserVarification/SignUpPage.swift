

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore

class SignUpPage: UIViewController {
    
    @IBOutlet weak var userOutlet: UITextField!
    @IBOutlet weak var emailOutlet:UITextField!
    @IBOutlet weak var passwordOutlate: UITextField!
    @IBOutlet weak var singUpButtonOutlate: UIButton!
    @IBOutlet weak var googleOutlate: UIButton!
    @IBOutlet weak var facbookOutlate: UIButton!
    @IBOutlet weak var twiterOutlate: UIButton!
    
    var fir: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
        fir = Firestore.firestore()
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
        
        passwordOutlate.layer.backgroundColor = UIColor.white.cgColor
        passwordOutlate.layer.cornerRadius = 9
        passwordOutlate.layer.shadowColor = UIColor.systemGray3.cgColor
        passwordOutlate.layer.shadowRadius = 4.0
        passwordOutlate.layer.shadowOpacity = 4.4
        passwordOutlate.layer.shadowOffset = CGSize(width: 4, height: 4)
        passwordOutlate.layer.masksToBounds = false
        
        emailOutlet.layer.backgroundColor = UIColor.white.cgColor
        emailOutlet.layer.cornerRadius = 9
        emailOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        emailOutlet.layer.shadowRadius = 4.0
        emailOutlet.layer.shadowOpacity = 4.4
        emailOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        emailOutlet.layer.masksToBounds = false
        
        userOutlet.layer.backgroundColor = UIColor.white.cgColor
        userOutlet.layer.cornerRadius = 9
        userOutlet.layer.shadowColor = UIColor.systemGray3.cgColor
        userOutlet.layer.shadowRadius = 4.0
        userOutlet.layer.shadowOpacity = 4.4
        userOutlet.layer.shadowOffset = CGSize(width: 4, height: 4)
        userOutlet.layer.masksToBounds = false
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        fireBaseAuth()
    }
    
    func fireBaseAuth() {
        Auth.auth().createUser(withEmail: emailOutlet.text!, password: passwordOutlate.text!) { [self]authDataResult, error in
            if error == nil {
                let uid = authDataResult?.user.uid
                self.fir.collection("User").document(uid!).setData(["userName":self.userOutlet.text!,"email":self.emailOutlet.text!,"password":self.passwordOutlate.text!])
                let directory = ["BirthDate":"-","Username":userOutlet.text!,"Name":"-","Bio":"","Number":"-","Gender":"-","Email": emailOutlet.text!,"ProfileImageUrl":"https://firebasestorage.googleapis.com/v0/b/chatbuddy-d0c0a.appspot.com/o/UserImages.png?alt=media&token=6bd52511-bb27-4eab-ad43-66f4de9efa78","UserUID":uid!] as! [String: Any]
                //self.ref.child("UserProfile").child((userUid!)).setValue(directory)
                self.fir.collection("UserProfile").document(uid!).setData(directory)
                navigate()
            }else{
                showAlert(title: error!.localizedDescription)
            }
        }
    }
    
    @IBAction func googleButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func facbookButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func twiterButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func showAlert(title:String) {
        let alert = UIAlertController(title: "Error!!", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        present(alert, animated:true, completion: nil)
    }
    
    func navigate() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TabBar
        navigationController?.pushViewController(navigation, animated: true)
        userOutlet.text == ""
        emailOutlet.text == ""
        passwordOutlate.text == ""
    }
    
}

