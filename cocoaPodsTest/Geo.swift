//
//  Geo.swift
//  cocoaPodsTest
//
//  Created by MOREAU Kévin on 13/07/2016.
//  Copyright © 2016 com.alyotech. All rights reserved.
//

import Foundation
import Decodable

public struct Geo {
    
    let lat: String
    let lng: String
}

extension Geo: Decodable {
    public static func decode(j: AnyObject) throws -> Geo {
        return try Geo(
            lat: j => "lat",
            lng: j => "lng"
        )
    }
}