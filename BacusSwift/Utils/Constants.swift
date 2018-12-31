//
//  Constants.swift
//  BacusSwift
//
//  Created by Alan Casas on 31/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import Foundation

let CONSTANTS = Constants()

struct Constants {
    let WINE_MODEL_CONSTANTS = WineModelConstants()
    let ERROR_DEFAULT_MESSAGE = ErrorDefaultConstantsMessages()
}

struct WineModelConstants {
    let NO_RATING_NUMBER: Int = -1
    let GLASS_RATING_IMAGE_NAME: String = "rating_glass"
}

struct ErrorDefaultConstantsMessages {
    let DEFAULT_WEB_TO_SHOW: URL = URL(string: "https://www.google.es")!
    let DEFAULT_GRAPES_TEXT: String = "No hay uvas que mostrar"
    let DEFAULT_NOTES_TEXT: String = "No hay notas que mostrar"
    let DEFAULT_IMAGE_NAME: String = "no image"
}




































