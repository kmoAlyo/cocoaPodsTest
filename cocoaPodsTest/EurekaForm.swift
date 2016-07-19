//
//  EurekaForm.swift
//  cocoaPodsTest
//
//  Created by MOREAU Kévin on 18/07/2016.
//  Copyright © 2016 com.alyotech. All rights reserved.
//

import Foundation
import Eureka

class EurekaForm: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section("Section1")
            <<< TextRow(){ row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
            }
            <<< PhoneRow(){
                $0.title = "Phone Row"
                $0.placeholder = "And numbers here"
            }
            +++ Section("Section2")
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = NSDate(timeIntervalSinceReferenceDate: 0)
        }
    }
}