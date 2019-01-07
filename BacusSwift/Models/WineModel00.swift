// To parse the JSON, add this file to your project and do:
//
//   let wineModel0 = try? newJSONDecoder().decode(WineModel0.self, from: jsonData)

import UIKit

//struct WineModel0: Codable {
//
//    let id: String
//    let wineOrigin: String?
//    let wineName: String?
//    let wineCompanyName: String?
//    let wineNotes: String?
//    let wineGrapes: [String]?
//    let year: Int?
//    let wineType: String?
//    let wineCompanyWeb: String?
//    let wineWeb: String?
////    let winePhoto: UIImage?
//    let winePhotoURL:URL?
//    let wineRating: Int?
//    let a: String?
//    let domain: String?
//    let user: String?
//    let pass: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case wineOrigin = "origin"
//        case wineName = "name"
//        case wineCompanyName = "company"
//        case wineNotes = "notes"
//        case wineGrapes = "grapes"
//        case year = "year"
//        case wineType = "type"
//        case wineCompanyWeb = "company_web"
//        case wineWeb = "wine_web"
//        case winePhoto = "picture"
//        case wineRating = "rating"
//        case a = "a"
//        case domain = "domain"
//        case user = "user"
//        case pass = "pass"
//    }
//
//    init (
//        id: String,
//     wineOrigin: String?,
//     wineName: String?,
//     wineCompanyName: String?,
//     wineNotes: String?,
//     wineGrapes: [String]?,
//     year: Int?,
//     wineType: String?,
//     wineCompanyWeb: String?,
//     wineWeb: String?,
////     winePhoto: UIImage?,
//     winePhotoURL:URL?,
//     wineRating: Int?,
//     a: String?,
//     domain: String?,
//     user: String?,
//     pass: String?
//        ) {
//        (self.id, self.wineOrigin, self.wineName, self.wineCompanyName, self.wineNotes, self.wineGrapes, self.year, self.wineType, self.wineCompanyWeb, self.wineWeb,
////         self.winePhoto,
//         self.winePhotoURL, self.wineRating, self.a, self.domain, self.user, self.pass) = (id, wineOrigin, wineName, wineCompanyName, wineNotes, wineGrapes, year, wineType, wineCompanyWeb, wineWeb,
////                                                                                           winePhoto,
//                                                                                           winePhotoURL, wineRating, a, domain, user, pass)
//    }
//
//    init(aDictionary: Dictionary <String, Any>) {
//
//        self.init(wineName: "", wineCompanyName: "", wineType: "", wineOrigin: "")
//
//            self.init(id: aDictionary[""]! as! String,
//                  wineOrigin: aDictionary[""]! as? String,
//                  wineName: aDictionary[""]! as? String,
//                  wineCompanyName: aDictionary[""]! as? String,
//                  wineNotes: aDictionary[""]! as? String,
//                  wineGrapes: extractGrapesFromJSONArray(jsonArray: aDictionary[""]!),
//                  year: aDictionary[""]! as? Int,
//                  wineType: aDictionary[""]! as? String,
//                  wineCompanyWeb: aDictionary[""]! as? String,
//                  wineWeb: aDictionary[""]! as? String,
////                  winePhoto: aDictionary[""]! as? UIImage,
//                  winePhotoURL: aDictionary[""]! as? URL,
//                  wineRating: aDictionary[""]! as? Int,
//                  a: aDictionary[""]! as? String,
//                  domain: aDictionary[""]! as? String,
//                  user: aDictionary[""]! as? String,
//                  pass: aDictionary[""]! as? String)
//
//    }
//
//    init(wineName: String?,
//         wineCompanyName: String?,
//         wineType: String?,
//         wineOrigin: String?) {
//        self.init(id: "", wineOrigin: wineOrigin, wineName: wineName, wineCompanyName: wineCompanyName, wineNotes: nil, wineGrapes: nil, year: nil, wineType: nil, wineCompanyWeb: nil, wineWeb: nil,
////                  winePhoto: nil,
//                  winePhotoURL: nil, wineRating: nil, a: nil, domain: nil, user: nil, pass: nil)
//
//    }
//
//    func extractGrapesFromJSONArray(jsonArray: Any) -> [String] {
//        guard let jsonArrayDes: [String] = (jsonArray as! [String]) else { return [""] }
//
//        var grapes = [String]()
//        for grape in jsonArrayDes {
//            grapes.append(grape)
//        }
//        return grapes
//    }
//
//    func wineImageToShow () -> UIImage {
//        var defaultImageToShow = UIImage(named: CONSTANTS.IMAGE_NAMES.DEFAULT_NO_IMAGE_TO_SHOW)
//
//        return defaultImageToShow!
//    }
//
//}

