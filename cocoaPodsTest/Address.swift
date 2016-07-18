//
//  Adress.swift
//  cocoaPodsTest
//
//  Created by MOREAU Kévin on 13/07/2016.
//  Copyright © 2016 com.alyotech. All rights reserved.
//

import Foundation
import Decodable

public struct Address {
    
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}


extension Address: Decodable {
    public static func decode(j: AnyObject) throws -> Address {
        return try Address(
            street: j => "street",
            suite: j => "suite",
            city: j => "city",
            zipcode: j => "zipcode",
            geo: Geo.decode(j => "geo")
        )
    }
}