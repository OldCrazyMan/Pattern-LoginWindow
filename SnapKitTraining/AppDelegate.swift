//
//  AppDelegate.swift
//  SnapKitTraining
//
//  Created by Тимур Ахметов on 01.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController = UITabBarController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        let viewController = ViewController()
        let viewNavBar = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem = UITabBarItem(title: "Snap", image: UIImage(systemName: "gamecontroller"), tag: 0)
        
        let snapViewController = SnapViewController()
        let snapNavBar = UINavigationController(rootViewController: snapViewController)
        snapViewController.tabBarItem = UITabBarItem(title: "Kit", image: UIImage(systemName: "gamecontroller.fill"), tag: 1)
        

        //tabBarController.tabBar.isHidden = true
        tabBarController.viewControllers = [viewNavBar, snapNavBar]
        
        
        return true
    }
}
