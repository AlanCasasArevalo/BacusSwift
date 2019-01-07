//
//  AppDelegate.swift
//  BacusSwift
//
//  Created by Alan Casas on 31/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.cyan
        self.window!.makeKeyAndVisible()
    
        /************************************************************************************
         * Model
         *************************************************************************************/
        let wineryModel = WineryModel()
        
        var rootVC = UIViewController()
  
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
            rootVC = rootViewControllerForiPhoneWithModel(wineryModel: wineryModel)
        } else {
            rootVC = rootViewControllerForiPadWithModel(wineryModel: wineryModel)
        }
        
        /************************************************************************************
         * Asign view controller to root window
         *************************************************************************************/
        window?.rootViewController = rootVC
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
    
    func rootViewControllerForiPhoneWithModel (wineryModel: WineryModel)  -> UINavigationController {
        let wineryTableVC = WineryTableViewController(wineryModel: wineryModel, aTableStyle: .plain)
        let wineryNavVC = UINavigationController(rootViewController: wineryTableVC)
        wineryTableVC.delegate = wineryTableVC
        
        return wineryNavVC
    }
    
    func rootViewControllerForiPadWithModel (wineryModel: WineryModel) -> UISplitViewController {
        let wineryTableVC = WineryTableViewController(wineryModel: wineryModel, aTableStyle: .plain)
        let wineryTableNavigationVC = UINavigationController(rootViewController: wineryTableVC)
        let wineVC = WineViewController(wineModel: wineryTableVC.lastSelectedWine())
        let wineNavigationVC = UINavigationController(rootViewController: wineVC)
        /************************************************************************************
         * SplitVC
         *************************************************************************************/
        let splitVC = UISplitViewController()
        splitVC.viewControllers = [wineryTableNavigationVC, wineNavigationVC]
        
        splitVC.delegate = wineVC
        wineryTableVC.delegate = wineVC
        
        return splitVC
    }
    
}

























