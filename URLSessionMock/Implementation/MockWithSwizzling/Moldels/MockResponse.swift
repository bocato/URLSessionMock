//
//  MockResponse.swift
//  PokeApp
//
//  Created by Eduardo Sanches Bocato on 09/08/18.
//  Copyright © 2018 Eduardo Sanches Bocato. All rights reserved.
//

import Foundation

public enum MockResponse {
    case success(statusCode: Int, headers: [String:String], body: Data?)
    case failure(error: NSError)
}

public typealias MockResponseClosure = (_ url: URL, _ extractions: [String]) -> MockResponse
