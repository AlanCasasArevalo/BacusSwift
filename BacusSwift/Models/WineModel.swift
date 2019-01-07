//
//  WineModel.swift
//  BacusSwift
//
//  Created by Alan Casas on 31/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit

struct WineModel {
    let wineName: String?
    let wineCompanyName: String?
    let wineType: String?
    let wineNotes: String?
    let wineOrigin: String?
    var winePhoto: UIImage?
    let wineCompanyWeb: String?
    let wineGrapes: [String]?
    let wineRating: Int?
    let winePhotoURL: URL?
    
    init(wineName: String?,
         wineCompanyName: String?,
         wineType: String?,
         wineNotes: String?,
         wineOrigin: String?,
         wineCompanyWeb: String?,
         wineGrapes: [String]?,
         wineRating: Int?,
         winePhotoURL: URL?) {
        
        self.wineName = wineName
        self.wineCompanyName = wineCompanyName
        self.wineType = wineType
        self.wineNotes = wineNotes
        self.wineOrigin = wineOrigin
        self.wineCompanyWeb = wineCompanyWeb
        self.wineGrapes = wineGrapes
        self.wineRating = wineRating
        self.winePhotoURL = winePhotoURL
        
    }
    
    init(wineName: String?,
         wineCompanyName: String?,
         wineType: String?,
         wineOrigin: String?) {
        
        self.init(wineName: wineName, wineCompanyName: wineCompanyName, wineType: wineType, wineNotes: nil, wineOrigin: wineOrigin, wineCompanyWeb: nil, wineGrapes: nil, wineRating: CONSTANTS.WINE_MODEL_CONSTANTS.NO_RATING_NUMBER, winePhotoURL: nil)
        
    }
    
    init(aDictionary: Dictionary<String, Any>) {
        self.init(wineName: "", wineCompanyName: "", wineType: "", wineOrigin: "")
        
        self.init(
            wineName: aDictionary["name"] as? String,
            wineCompanyName: aDictionary["company"] as? String,
            wineType: aDictionary["type"] as? String,
            wineNotes: aDictionary["notes"] as? String,
            wineOrigin: aDictionary["origin"] as? String,
            wineCompanyWeb: aDictionary["company_web"] as? String,
            wineGrapes: self.extractGrapesFromJSONArray(jsonArray: (aDictionary["grapes"] as? [Dictionary<String, String>])!),
            wineRating: aDictionary["rating"] as? Int,
            winePhotoURL: aDictionary["picture"] as? URL
        )
        
        self.winePhoto = wineImageToShow(winePicture: aDictionary["picture"] as! String)
        
    }
    
    func extractGrapesFromJSONArray(jsonArray: [Dictionary<String, String>]) -> [String] {
        var grapesArray = [String]()
        
        for json in jsonArray {
            grapesArray.append(json["grape"]!)
        }
        
        return grapesArray
    }
    
    func wineImageToShow (winePicture: String) -> UIImage {
        
        let url = URL(string: winePicture)
        
        var defaultImageToShow: UIImage?
        if let photoData = NSData(contentsOf: url!),
            let winePhoto = UIImage(data: (photoData as? Data)!){
            defaultImageToShow = winePhoto
        }else {
            defaultImageToShow = UIImage(named: CONSTANTS.IMAGE_NAMES.DEFAULT_NO_IMAGE_TO_SHOW)!
        }
        return defaultImageToShow!
        
    }
    
}








































