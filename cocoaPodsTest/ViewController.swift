//
//  ViewController.swift
//  cocoaPodsTest
//
//  Created by MOREAU Kévin on 12/07/2016.
//  Copyright © 2016 com.alyotech. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Code démo Realm - BDD
        
        let myDog = Dog()
        myDog.name = "Rex"
        myDog.age = 1
        print("name of dog: \(myDog.name)")
        
        
        // Get the default Realm
        let realm = try! Realm()
        
        // Query Realm for all dogs less than 2 years old
        let puppies = realm.objects(Dog.self).filter("age < 2")
        puppies.count // => 0 because no dogs have been added to the Realm yet
        
        // Persist your data easily
        try! realm.write {
            realm.add(myDog)
        }
        
        // Query and update from any thread
        dispatch_async(dispatch_queue_create("background", nil)) {
            let realm = try! Realm()
            let theDog = realm.objects(Dog.self).filter("age == 1").first
            try! realm.write {
                theDog!.age = 3
            }
        }
        
        // Query and update from any thread
        dispatch_async(dispatch_queue_create("background", nil)) {
            let realm = try! Realm()
            let dogNumbers = realm.objects(Dog.self).filter("age <= 1")
//            print("number of dog >= 1 year : \(dogNumbers.count)")
        }
        
        // End démo Realm
        
        
        // Code démo Alamofire - BDD
        
        Alamofire.request(.GET, "http://jsonplaceholder.typicode.com/users")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
//                print(response)
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    
                    do {
                        
                        let user = try User.decode(JSON)
                        print("user : \(user.name)")
                    } catch {
                        print(error)
                    }
                }
        }
        
        // End démo Alamofire

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

