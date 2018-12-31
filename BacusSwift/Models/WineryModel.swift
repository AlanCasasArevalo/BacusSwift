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
    var otherWines: [WineModel] = [WineModel]()
    
    init() {
        
        /************************************************************************************
         * Model and model properties
         *************************************************************************************/
        let bembibrePhoto = UIImage(named: CONSTANTS.IMAGE_NAMES.BEMBIBRE_IMAGE_NAME)
        let albarinoPhoto = UIImage(named: CONSTANTS.IMAGE_NAMES.ALBARINO_IMAGE_NAME)
        let guzmanPhoto = UIImage(named: CONSTANTS.IMAGE_NAMES.GUZMAN_IMAGE_NAME)
        
        let bembibreCompanyWeb = CONSTANTS.WEB_COMPANIES_URLS.BEMBIBRE_COMPANY_WEB
        let albarinoCompanyWeb = CONSTANTS.WEB_COMPANIES_URLS.ALBARINO_COMPANY_WEB
        let guzmanCompanyWeb = CONSTANTS.WEB_COMPANIES_URLS.GUZMAN_COMPANY_WEB
        
        let bembibreWineModel = WineModel(wineName: "Bembibre", wineCompanyName: "Dominio de Tares", wineType: "tinto", wineNotes: "Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado.", wineOrigin: "El Bierzo", winePhoto: bembibrePhoto, wineCompanyWeb: bembibreCompanyWeb, wineGrapes: ["Mencía"], wineRating: 5)
        
        let albarinoWineModel = WineModel(wineName: "Zarate", wineCompanyName: "Zarate", wineType: "Blanco", wineNotes: "El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito.", wineOrigin: "Rias Bajas", winePhoto: albarinoPhoto, wineCompanyWeb: albarinoCompanyWeb, wineGrapes: ["Albariño"], wineRating: 4)
        
        let guzmanWineModel = WineModel(wineName: "Raiz de Guzman", wineCompanyName: "Raiz de Guzman", wineType: "Rosado", wineNotes: "Raíz de Guzmán son vinos con denominación de origen Ribera del Duero elaborados con uva 100% tempranillo en la localidad burgalesa de Roa de Duero. Tradición e innovación se funden en su elaboración y se traducen, al término del proceso, en productos exclusivos y de altísima calidad, la seña de identidad de la casa.", wineOrigin: "Ribera del Duero", winePhoto: guzmanPhoto, wineCompanyWeb: guzmanCompanyWeb, wineGrapes: ["Chardonnay"], wineRating: 3)
        
        redWines.append(bembibreWineModel)
        whiteWines.append(albarinoWineModel)
        otherWines.append(guzmanWineModel)
        
    }
    
    func redWineCount() -> Int {
        return redWines.count
    }
    
    func whiteWineCount() -> Int {
        return whiteWines.count
    }
    
    func otherWineCount() -> Int {
        return otherWines.count
    }
    
    func redWineAtIndex(indexPath: Int) -> WineModel {
        return self.redWines[indexPath]
    }
    
    func whiteWineAtIndex(indexPath: Int) -> WineModel {
        return self.whiteWines[indexPath]
    }
    
    func otherWineAtIndex(indexPath: Int) -> WineModel {
        return self.otherWines[indexPath]
    }
    
}



