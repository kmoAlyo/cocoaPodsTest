//
//  Person.swift
//  cocoaPodsTest
//
//  Created by MOREAU Kévin on 12/07/2016.
//  Copyright © 2016 com.alyotech. All rights reserved.
//

import Foundation
import RealmSwift

class Person : Object{
    var name = ""
    var picture: NSData? = nil // optionals supported
    var dogs = List<Dog>()
}