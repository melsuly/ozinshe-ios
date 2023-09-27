//
// Created for Ozinshe in 2023
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // fix for SVProgressHud
        (UIApplication.shared.delegate as! AppDelegate).window = window

        // show tabs if authorized
        if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
            Storage.shared.accessToken = accessToken

            let window = UIWindow(windowScene: windowScene)

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(identifier: "TabBarController")

            window.rootViewController = tabBarController

            window.makeKeyAndVisible()

            self.window = window
        }

    }
}

