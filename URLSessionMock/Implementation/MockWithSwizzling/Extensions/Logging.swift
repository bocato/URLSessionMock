//
//  Logging.swift
//  PokeApp
//
//  Created by Eduardo Sanches Bocato on 09/08/18.
//  Copyright © 2018 Eduardo Sanches Bocato. All rights reserved.
//

import Foundation

func Log(prefix: String = "", format: String) {
    if prefix != "" {
        NSLog("[%@] %@", prefix, format)
    } else {
       NSLog("%@", format)
    }
}

func DebugLog(prefix: String = "", format: String) {
    var logString = ""
    if prefix != "" {
        logString = "[\(prefix)] " + format
    } else {
        logString = format
    }
    debugPrint(logString)
}
