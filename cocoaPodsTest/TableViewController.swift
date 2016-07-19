//
//  TableViewController.swift
//  cocoaPodsTest
//
//  Created by MOREAU Kévin on 18/07/2016.
//  Copyright © 2016 com.alyotech. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class TableViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "It's your choice !"
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
        
        // Code démo Alamofire - BDD
        
        Alamofire.request(.GET, "http://jsonplaceholder.typicode.com/users")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                //                print(response)
                if let JSON = response.result.value {
                    //                    print("JSON: \(JSON)")
                    
                    do {
                        
                        self.users = try [User].decode(JSON)
                        self.myTableView.reloadData()
                    } catch {
                        print(error)
                    }
                }
        }
        
        // End démo Alamofire
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! TableViewCell
        
        cell.idUser.text = String(users[indexPath.row].id)
        cell.name.text = String(users[indexPath.row].name)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.005
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.005
    }
    
}