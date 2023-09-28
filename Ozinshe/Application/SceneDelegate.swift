//
// Created for Ozinshe in 2023
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

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
}

