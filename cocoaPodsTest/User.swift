//
//  User.swift
//  cocoaPodsTest
//
//  Created by MOREAU Kévin on 13/07/2016.
//  Copyright © 2016 com.alyotech. All rights reserved.
//

import Foundation
import Decodable

public struct User {

    let id: Int
    let name: String
    let userName: String
    let email: String
    let address: Address
    let geo: Geo
    let phone: String
    let website: String
    let company: Company
}


extension User: Decodable {
    public static func decode(j: AnyObject) throws -> User {
        return try User(
            id: j => "id",
            name: j => "name",
            userName: j => "userName",
            email: j => "email",
            address: Address.decode(j => "address"),
            geo: Geo.decode(j => "geo"),
            phone: j => "phone",
            website: j => "website",
            company: Company.decode(j => "company")
        )
    }
}