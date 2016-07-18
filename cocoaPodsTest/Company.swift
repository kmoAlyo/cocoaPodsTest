//
//  Company.swift
//  cocoaPodsTest
//
//  Created by MOREAU Kévin on 13/07/2016.
//  Copyright © 2016 com.alyotech. All rights reserved.
//

import Foundation
import Decodable

public struct Company {
    
    let name: String
    let catchPhrase: String
    let bs: String
}

extension Company: Decodable {
    public static func decode(j: AnyObject) throws -> Company {
        return try Company(
            name: j => "name",
            catchPhrase: j => "catchPhrase",
            bs: j => "bs"
        )
    }
}