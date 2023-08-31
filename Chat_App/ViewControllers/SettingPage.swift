

import UIKit
import FirebaseAuth
import FBSDKCoreKit

class SettingPage: UIViewController {

   
    @IBOutlet weak var darkModeButton: UIButton!
    @IBOutlet weak var editAccountButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var feedBackButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var switchAccountButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var countryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
    }
   
    func set() {
        
        darkModeButton.layer.backgroundColor = UIColor.white.cgColor
        darkModeButton.layer.cornerRadius = 9
        darkModeButton.layer.shadowColor = UIColor.systemGray4.cgColor
        darkModeButton.layer.shadowRadius = 4.0
        darkModeButton.layer.shadowOpacity = 4.4
        darkModeButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        darkModeButton.layer.masksToBounds = false
        
        editAccountButton.layer.backgroundColor = UIColor.white.cgColor
        editAccountButton.layer.cornerRadius = 9
        editAccountButton.layer.shadowColor = UIColor.systemGray4.cgColor
        editAccountButton.layer.shadowRadius = 4.0
        editAccountButton.layer.shadowOpacity = 4.4
        editAccountButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        editAccountButton.layer.masksToBounds = false
        
        signOutButton.layer.backgroundColor = UIColor.white.cgColor
        signOutButton.layer.cornerRadius = 9
        signOutButton.layer.shadowColor = UIColor.systemGray4.cgColor
        signOutButton.layer.shadowRadius = 4.0
        signOutButton.layer.shadowOpacity = 4.4
        signOutButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        signOutButton.layer.masksToBounds = false
        
        feedBackButton.layer.backgroundColor = UIColor.white.cgColor
        feedBackButton.layer.cornerRadius = 9
        feedBackButton.layer.shadowColor = UIColor.systemGray4.cgColor
        feedBackButton.layer.shadowRadius = 4.0
        feedBackButton.layer.shadowOpacity = 4.4
        feedBackButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        feedBackButton.layer.masksToBounds = false
        
        changePasswordButton.layer.backgroundColor = UIColor.white.cgColor
        changePasswordButton.layer.cornerRadius = 9
        changePasswordButton.layer.shadowColor = UIColor.systemGray4.cgColor
        changePasswordButton.layer.shadowRadius = 4.0
        changePasswordButton.layer.shadowOpacity = 4.4
        changePasswordButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        changePasswordButton.layer.masksToBounds = false
        
        switchAccountButton.layer.backgroundColor = UIColor.white.cgColor
        switchAccountButton.layer.cornerRadius = 9
        switchAccountButton.layer.shadowColor = UIColor.systemGray4.cgColor
        switchAccountButton.layer.shadowRadius = 4.0
        switchAccountButton.layer.shadowOpacity = 4.4
        switchAccountButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        switchAccountButton.layer.masksToBounds = false
        
        aboutButton.layer.backgroundColor = UIColor.white.cgColor
        aboutButton.layer.cornerRadius = 9
        aboutButton.layer.shadowColor = UIColor.systemGray4.cgColor
        aboutButton.layer.shadowRadius = 4.0
        aboutButton.layer.shadowOpacity = 4.4
        aboutButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        aboutButton.layer.masksToBounds = false
        
        languageButton.layer.backgroundColor = UIColor.white.cgColor
        languageButton.layer.cornerRadius = 9
        languageButton.layer.shadowColor = UIColor.systemGray4.cgColor
        languageButton.layer.shadowRadius = 4.0
        languageButton.layer.shadowOpacity = 4.4
        languageButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        languageButton.layer.masksToBounds = false
        
        notificationButton.layer.backgroundColor = UIColor.white.cgColor
        notificationButton.layer.cornerRadius = 9
        notificationButton.layer.shadowColor = UIColor.systemGray4.cgColor
        notificationButton.layer.shadowRadius = 4.0
        notificationButton.layer.shadowOpacity = 4.4
        notificationButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        notificationButton.layer.masksToBounds = false
        
        countryButton.layer.backgroundColor = UIColor.white.cgColor
        countryButton.layer.cornerRadius = 9
        countryButton.layer.shadowColor = UIColor.systemGray4.cgColor
        countryButton.layer.shadowRadius = 4.0
        countryButton.layer.shadowOpacity = 4.4
        countryButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        countryButton.layer.masksToBounds = false
        
    }
    
    
    @IBAction func signOutButtonAction(_ sender: Any) {
        do {
                try Auth.auth().signOut()
            let navigation = storyboard?.instantiateViewController(withIdentifier: "SignInPage") as! SignInPage
            navigationController?.popViewController(animated: true)
            present(navigation, animated: true)
            } catch let error as NSError {
                print("Error signing out: \(error.localizedDescription)")
            }
       
    }
    
    @IBAction func changePassword(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "ChangePasswordePage") as! ChangePasswordePage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func feedBackAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "FeedBackPage") as! FeedBackPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func editProfile(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "EditProfilePage") as! EditProfilePage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func notification(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "NotificationPage") as! NotificationPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func SwichAccount(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "SignInPage") as! SignInPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}

    
    
                                
