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
    let IMAGE_NAMES = ImageName()
    let WEB_COMPANIES_URLS = WebCompaniesURLs()
    let WINERY_TABLE_VIEW_CONSTANTS = WineryTableViewConstants()
    let WINERY_NOTIFICATION = WineryNotification()
    let WINE_USER_DEFAULTS = WineUserDefaults() 
}

struct WineModelConstants {
    let NO_RATING_NUMBER: Int = -1
}

struct ImageName {
    let GLASS_RATING_IMAGE_NAME: String = "rating_glass"
    let BEMBIBRE_IMAGE_NAME: String = "bembibre"
    let ALBARINO_IMAGE_NAME: String = "zarate"
    let GUZMAN_IMAGE_NAME: String = "guzman"
}

struct WebCompaniesURLs {
    let BEMBIBRE_COMPANY_WEB = URL(string: "https://www.dominiodetares.com/portfolio/bembibre/")
    let ALBARINO_COMPANY_WEB = URL(string: "https://www.bodeboca.com/vino/zarate-tras-da-vina-2015")
    let GUZMAN_COMPANY_WEB = URL(string: "https://www.vinopremier.com/vino-rosado-raiz-de-guzman-2015.html")
}

struct ErrorDefaultConstantsMessages {
    let DEFAULT_WEB_TO_SHOW: URL = URL(string: "https://www.google.es")!
    let DEFAULT_GRAPES_TEXT: String = "No hay uvas que mostrar"
    let DEFAULT_NOTES_TEXT: String = "No hay notas que mostrar"
    let DEFAULT_IMAGE_NAME: String = "no image"
}

struct WineryTableViewConstants {
    let WINERY_REUSE_CELL_IDENTIFIER = "WINERY_REUSE_CELL_IDENTIFIER"
    let RED_WINE_SECTION = 0
    let WHITE_WINE_SECTION = 1
    let OTHER_WINE_SECTION = 2
}

struct WineryNotification {
    let DID_SELECT_WINE_NOTIFICATION_NAME = "DID_SELECT_WINE_NOTIFICATION_NAME"
    let WINE_MODEL_KEY = "WINE_MODEL_KEY"
}

struct WineUserDefaults {
    let SECTION_KEY = "section"
    let ROW_KEY = "row"
    let LAST_WINE_KEY = "lastWineSelected"
}



































