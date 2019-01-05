//
//  FunctionUtils.swift
//  BacusSwift
//
//  Created by Alan Casas on 31/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import Foundation

struct  FunctionUtils {
    
    func arrayToString(arrayToConvert: [String]) -> String {
        
        var representationGrapes = ""
        
        if arrayToConvert.count == 1 {
            representationGrapes = "100% \(arrayToConvert[0])"
        } else {
            representationGrapes = arrayToConvert.joined(separator: ", ")
        }
        
        return representationGrapes
    }
    
}

















