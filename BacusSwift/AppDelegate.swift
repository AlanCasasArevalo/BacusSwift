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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.cyan
        self.window!.makeKeyAndVisible()

        /************************************************************************************
         * Model and model properties
         *************************************************************************************/
        let bembibrePhoto = UIImage(named: "bembibre")
        let bembibreCompanyWeb = URL(string: "https://www.dominiodetares.com/portfolio/bembibre/")
        
        let defaultWineModel = WineModel(wineName: "Bembibre", wineCompanyName: "Dominio de Tares", wineType: "tinto", wineNotes: "Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado.", wineOrigin: "El Bierzo", winePhoto: bembibrePhoto, wineCompanyWeb: bembibreCompanyWeb, wineGrapes: ["Mencía"], wineRating: 5)
        let defaultWineWithoutProperties = WineModel(wineName: "Bembibre", wineCompanyName: "Dominio de Tares", wineType: "tinto", wineOrigin: "El Bierzo")

        
        /************************************************************************************
         * Main VC
         *************************************************************************************/
        let wineViewController = WineViewController(wineModel: defaultWineModel)

        /************************************************************************************
         * Navigation VC and add wineVC as root
         *************************************************************************************/
        let navigationWineVC = UINavigationController(rootViewController: wineViewController)
        
        /************************************************************************************
         * Asign view controller to root window
         *************************************************************************************/
        window?.rootViewController = navigationWineVC
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}

























