//
//  SceneDelegate.swift
//  HealthSense
//
//  Created by Sensehack on 3/24/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        print("#### Scene Delegate")
        // Setting default Window View Controller programmatically. We can also remove "Main" storyboard references in Main proj and info.plist
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        if UserDefaults.standard.bool(forKey: HSUserDefaults.kFirstLaunch.rawValue) {
            print("Default launch")
            Settings.sharedInstance.appRestoreSettings()
            let storyboard = UIStoryboard(name: HSStoryboard.kHomeVC.rawValue, bundle: nil)
            self.window?.rootViewController = storyboard.instantiateViewController(identifier: HSCustomViewController.kTabBarVC.rawValue)
        } else {
            print("First launch")
            Settings.sharedInstance.setAppSettings()
            let storyboard = UIStoryboard(name: HSStoryboard.kOnboardingVC.rawValue, bundle: nil)
            self.window?.rootViewController = storyboard.instantiateViewController(identifier: HSCustomViewController.kOnboardingVC.rawValue)
        }
        // Calling Analytics function
        SettingsStruct.isAnalytics ? Analytics().setup(): nil
        
        // Old way of checking for those Structs and letting ViewController handle the UX logic
//        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

