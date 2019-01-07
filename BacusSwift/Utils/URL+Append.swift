//
//  URL+Append.swift
//  BacusSwift
//
//  Created by Alan Casas on 07/01/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

extension URL {
    func appendingQueryParameters(_ parametersDictionary : [String : String]) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
}
