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
    let winePhoto: UIImage?
    let wineCompanyWeb: URL?
    let wineGrapes: [String]?
    let wineRating: Int?
    
    init(wineName: String?,
         wineCompanyName: String?,
         wineType: String?,
         wineNotes: String?,
         wineOrigin: String?,
         winePhoto: UIImage?,
         wineCompanyWeb: URL?,
         wineGrapes: [String]?,
         wineRating: Int?) {
        (self.wineName, self.wineCompanyName, self.wineType, self.wineNotes, self.wineOrigin, self.winePhoto, self.wineCompanyWeb, self.wineGrapes, self.wineRating) = (wineName, wineCompanyName, wineType, wineNotes, wineOrigin, winePhoto, wineCompanyWeb, wineGrapes, wineRating)
    }
    
    init(wineName: String?,
                     wineCompanyName: String?,
                     wineType: String?,
                     wineOrigin: String?) {
        self.init(wineName: wineName, wineCompanyName: wineCompanyName, wineType: wineType, wineNotes: nil, wineOrigin: wineOrigin, winePhoto: nil, wineCompanyWeb: nil, wineGrapes: nil, wineRating: CONSTANTS.WINE_MODEL_CONSTANTS.NO_RATING_NUMBER)
    }
    
}






































