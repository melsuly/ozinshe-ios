//
// Created for Ozinshe in 2023
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: TextFieldWithPadding!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: TextFieldWithPadding!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    func configureViews() {
        emailTextField.layer.borderColor = UIColor(red: 0.9, green: 0.92, blue: 0.94, alpha: 1).cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 12
        
        passwordTextField.layer.borderColor = UIColor(red: 0.9, green: 0.92, blue: 0.94, alpha: 1).cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 12
        
        loginButton.layer.cornerRadius = 12
    }
    
    @IBAction func togglePassword(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @IBAction func forgotPasswordTouched(_ sender: Any) {
        // TODO: Open password recovery VC
    }
    
    @IBAction func loginTouched(_ sender: Any) {
        // credentials
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        // validation
        if email.isEmpty || password.isEmpty { return }
        
        // request to API
        SVProgressHUD.show()
        
        let parameters = [
            "email": email,
            "password": password
        ]
        
        AF.request("http://api.ozinshe.com/auth/V1/signin", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { result in
            SVProgressHUD.dismiss()
            
            // check response body
            if let data = result.data {
                let json = JSON(data)
                
                if let accessToken = json["accessToken"].string,
                   let userEmail = json["email"].string {
                    Storage.shared.accessToken = accessToken
                    Storage.shared.userEmail = userEmail
                    
                    UserDefaults.standard.set(accessToken, forKey: "accessToken")
                    UserDefaults.standard.set(userEmail, forKey: "userEmail")
                    
                    self.startApp()
                    
                    return
                }
            }
            
            // 401
            if result.response?.statusCode == 401 {
                SVProgressHUD.showError(withStatus: "Неправильный email или пароль!")
                return
            }
            
            // any unexpected error
            SVProgressHUD.showError(withStatus: String(data: result.data ?? Data(), encoding: .utf8))
        }
    }
    
    @IBAction func registerTouched(_ sender: Any) {
        // TODO: Open register VC
    }
    
    func startApp() {
        let tabBarController = (storyboard?.instantiateViewController(identifier: "TabBarController"))!
        
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.modalTransitionStyle = .flipHorizontal
        
        self.present(tabBarController, animated: true)
    }
}

