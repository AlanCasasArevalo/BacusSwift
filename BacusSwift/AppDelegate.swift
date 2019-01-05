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
         * Model and model properties
         *************************************************************************************/
//        let bembibrePhoto = UIImage(named: CONSTANTS.IMAGE_NAMES.BEMBIBRE_IMAGE_NAME)
//        let albarinoPhoto = UIImage(named: CONSTANTS.IMAGE_NAMES.ALBARINO_IMAGE_NAME)
//        let guzmanPhoto = UIImage(named: CONSTANTS.IMAGE_NAMES.GUZMAN_IMAGE_NAME)
//
//        let bembibreCompanyWeb = CONSTANTS.WEB_COMPANIES_URLS.BEMBIBRE_COMPANY_WEB
//        let albarinoCompanyWeb = CONSTANTS.WEB_COMPANIES_URLS.ALBARINO_COMPANY_WEB
//        let guzmanCompanyWeb = CONSTANTS.WEB_COMPANIES_URLS.GUZMAN_COMPANY_WEB
//
//        let bembibreWineModel = WineModel(wineName: "Bembibre", wineCompanyName: "Dominio de Tares", wineType: "tinto", wineNotes: "Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado.", wineOrigin: "El Bierzo", winePhoto: bembibrePhoto, wineCompanyWeb: bembibreCompanyWeb, wineGrapes: ["Mencía"], wineRating: 5)
//        let bembibreWineWithoutProperties = WineModel(wineName: "Bembibre", wineCompanyName: "Dominio de Tares", wineType: "tinto", wineOrigin: "El Bierzo")
//
//        let albarinoWineModel = WineModel(wineName: "Zarate", wineCompanyName: "Zarate", wineType: "Blanco", wineNotes: "El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito.", wineOrigin: "Rias Bajas", winePhoto: albarinoPhoto, wineCompanyWeb: albarinoCompanyWeb, wineGrapes: ["Albariño"], wineRating: 4)
//
//        let guzmanWineModel = WineModel(wineName: "Raiz de Guzman", wineCompanyName: "Raiz de Guzman", wineType: "Rosado", wineNotes: "Raíz de Guzmán son vinos con denominación de origen Ribera del Duero elaborados con uva 100% tempranillo en la localidad burgalesa de Roa de Duero. Tradición e innovación se funden en su elaboración y se traducen, al término del proceso, en productos exclusivos y de altísima calidad, la seña de identidad de la casa.", wineOrigin: "Ribera del Duero", winePhoto: guzmanPhoto, wineCompanyWeb: guzmanCompanyWeb, wineGrapes: ["Chardonnay"], wineRating: 3)
//
        
        /************************************************************************************
         * Main VC
         *************************************************************************************/
//        let wineViewController = WineViewController(wineModel: bembibreWineModel)
//        let albarinoVC = WineViewController(wineModel: albarinoWineModel)
//        let guzmanVC = WineViewController(wineModel: guzmanWineModel)
        
        /************************************************************************************
         * Navigation VC and add wineVC as root
         *************************************************************************************/
//        let navigationWineVC = UINavigationController(rootViewController: wineViewController)
//        let albarinoNVC = UINavigationController(rootViewController: albarinoVC)
//        let guzmanNVC = UINavigationController(rootViewController: guzmanVC)
        
        
//        let tabBar = UITabBarController()
//        tabBar.viewControllers = [navigationWineVC, albarinoNVC, guzmanNVC]
        
        let wineryModel = WineryModel()
        
        let wineryTableVC = WineryTableViewController(wineryModel: wineryModel, aTableStyle: .plain)
        let wineryTableNavigationVC = UINavigationController(rootViewController: wineryTableVC)
        
        let wineVC = WineViewController(wineModel: wineryTableVC.lastSelectedWine()
        )
        let wineNavigationVC = UINavigationController(rootViewController: wineVC)
        
        /************************************************************************************
         * SplitVC
         *************************************************************************************/
        let splitVC = UISplitViewController()
        splitVC.viewControllers = [wineryTableNavigationVC, wineNavigationVC]
        
        splitVC.delegate = wineVC
        wineryTableVC.delegate = wineVC
        
        /************************************************************************************
         * Asign view controller to root window
         *************************************************************************************/
        window?.rootViewController = splitVC
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}

























