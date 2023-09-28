//
// Created for Ozinshe in 2023
//

import UIKit
import Localize_Swift

class ProfileViewController: UIViewController, LanguageProtocol {
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        languageDidChange()
    }
    
    func configureViews() {
        emailLabel.text = Storage.shared.userEmail
    }
    
    @IBAction func personalDataTouched(_ sender: Any) {
    }
    
    @IBAction func changePasswordTouched(_ sender: Any) {
        let changePasswordVC = storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
        
        navigationController?.show(changePasswordVC, sender: self)
    }
    
    @IBAction func changeLanguageTouched(_ sender: Any) {
        let languageModalController = storyboard?.instantiateViewController(identifier: "LanguageModalController") as! LanguageModalController
        
        languageModalController.delegate = self
        languageModalController.modalPresentationStyle = .overFullScreen
        
        present(languageModalController, animated: true)
    }
    
    @IBAction func themeSwitchValueChanged(_ sender: UISwitch) {
        // TODO: Theme switch
        print("Is dark theme: \(sender.isOn)")
    }
    
    @IBAction func logoutTouched(_ sender: Any) {
        let logoutModalController = storyboard?.instantiateViewController(identifier: "LogoutModalController") as! LogoutModalController
        
        logoutModalController.modalPresentationStyle = .overFullScreen
        
        present(logoutModalController, animated: true)
    }
    
    func languageDidChange() {
        languageLabel.text = "LANGUAGE_NAME".localized()
    }
}
