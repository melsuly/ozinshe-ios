//
// Created for Ozinshe in 2023
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // navigation bar
        configureNavBar()

        // show tabs if authorized
        if let accessToken = UserDefaults.standard.string(forKey: "accessToken"),
           let userEmail = UserDefaults.standard.string(forKey: "userEmail") {
            Storage.shared.accessToken = accessToken
            Storage.shared.userEmail = userEmail

            let window = UIWindow(windowScene: windowScene)

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(identifier: "TabBarController")

            window.rootViewController = tabBarController

            window.makeKeyAndVisible()

            self.window = window
        }

        // fix for SVProgressHud
        (UIApplication.shared.delegate as! AppDelegate).window = window
    }

    func configureNavBar() {
        // hide back button title
        let attributes = [NSAttributedString.Key.font:  UIFont(name: "Helvetica-Bold", size: 0.1)!, NSAttributedString.Key.foregroundColor: UIColor.clear]

        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .highlighted)

        // replace back button icon
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "back-button")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "back-button")
    }
}

