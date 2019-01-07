//
//  WineryModel.swift
//  BacusSwift
//
//  Created by Alan Casas on 31/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit

struct WineryModel {
    
    var redWines: [WineModel] = [WineModel]()
    var whiteWines: [WineModel] = [WineModel]()
    var roseWines: [WineModel] = [WineModel]()
    var champagneWines: [WineModel] = [WineModel]()
    
    init() {
        
        var customError: NSError?
        var errorDefaultMessage = "Ha habido un error al intentar hacer la conversion de JSON e inicializarlo dentro de los vinos"
        
        let urlString = "http://static.keepcoding.io/baccus/wines.json"
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        guard var backendUrl = URL(string: urlString) else {return}
        
        var request = URLRequest(url: backendUrl)
        request.httpMethod = "GET"
        //        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
        //            let statusCode = (response as! HTTPURLResponse).statusCode
        //            guard let dataDes = data else {return}
        //            if (error == nil) {
        //                do{
        //                    print("URL Session Usage Task Succeeded: HTTP \(statusCode)")
        //                    let json = try JSONDecoder().decode(Usage.self, from: dataDes)
        //                    completion(json, statusCode)
        //                }catch{
        //                    completion(nil, statusCode)
        //                }
        //            }else {
        //                print("URL Session Task Failed: %@", error!.localizedDescription);
        //                completion(nil, statusCode)
        //            }
        //        })
        //        task.resume()
        
        var dataJsonResult = NSData(contentsOf: backendUrl) as? Data
        
        if dataJsonResult == nil {
            customError = NSError(domain: "Baccus.Model", code: 42, userInfo: [NSLocalizedDescriptionKey: errorDefaultMessage])
        } else {
            
            do {
                //                let jsonResult = try JSONSerialization.jsonObject(with: dataJsonResult, options: []) as! [String: AnyObject]

                let jsonObject = try JSONSerialization.jsonObject(with: dataJsonResult!, options: JSONSerialization.ReadingOptions.allowFragments) as! [Dictionary<String,Any>]

                if jsonObject != nil {
                                                            
                    for jsonWineDictionary in jsonObject {
                        
                        if jsonWineDictionary["name"] == nil {
                            customError = NSError(domain: "Baccus.Model", code: 42, userInfo: [NSLocalizedDescriptionKey: errorDefaultMessage])
                        } else{
                            let wineFromJson = WineModel(aDictionary: jsonWineDictionary)
                            
                            if wineFromJson.wineName != nil {
                                if wineFromJson.wineType == CONSTANTS.WINE_SECTIONS_KEY.RED_WINE_KEY {
                                    if self.redWines == nil {
                                        redWines = [WineModel]()
                                        redWines.append(wineFromJson)
                                    }else {
                                        redWines.append(wineFromJson)
                                    }
                                    
                                }else if wineFromJson.wineType == CONSTANTS.WINE_SECTIONS_KEY.WHITE_WINE_KEY {
                                    if self.whiteWines == nil {
                                        whiteWines = [WineModel]()
                                        whiteWines.append(wineFromJson)
                                    }else {
                                        whiteWines.append(wineFromJson)
                                    }
                                }else if wineFromJson.wineType == CONSTANTS.WINE_SECTIONS_KEY.ROSE_WINE_KEY {
                                    if self.roseWines == nil {
                                        roseWines = [WineModel]()
                                        roseWines.append(wineFromJson)
                                    }else {
                                        roseWines.append(wineFromJson)
                                    }
                                }else if wineFromJson.wineType == CONSTANTS.WINE_SECTIONS_KEY.CHAMPAGNE_WINE_KEY {
                                    if self.champagneWines == nil {
                                        champagneWines = [WineModel]()
                                        champagneWines.append(wineFromJson)
                                    }else {
                                        champagneWines.append(wineFromJson)
                                    }
                                }
                            }

                        }
                    }
                    
                }
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        
    }
    
    func redWineCount() -> Int {
        return redWines.count
    }
    
    func whiteWineCount() -> Int {
        return whiteWines.count
    }
    
    func roseWineCount() -> Int {
        return roseWines.count
    }
    
    func champagneWineCount() -> Int {
        return champagneWines.count
    }
    
    func redWineAtIndex(indexPath: Int) -> WineModel {
        return self.redWines[indexPath]
    }
    
    func whiteWineAtIndex(indexPath: Int) -> WineModel {
        return self.whiteWines[indexPath]
    }
    
    func roseWineAtIndex(indexPath: Int) -> WineModel {
        return self.roseWines[indexPath]
    }
    func champagneWineAtIndex(indexPath: Int) -> WineModel {
        return self.champagneWines[indexPath]
    }
    
}




