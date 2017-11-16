//
//  Person.swift
//  Realm_text
//
//  Created by mm on 16/8/4.
//  Copyright © 2016年 mm. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    dynamic var id = NSUUID().uuidString
    dynamic var name = ""
    dynamic var birthdate = NSDate()
    let dogs = List<Dog>()
    
    override static func primaryKey() ->String?{
        return "id"
    }
    
//    func IncrementaID() -> Int {
//        let realm = try! Realm()
//        let RetNext: NSArray = Array(realm.objects(Person).sorted("id"))
//        let last = RetNext.lastObject
//        if RetNext.count > 0 {
//            let valor = last?.valueForKey("id") as? Int
//            return valor! + 1
//        } else {
//            return 1
//        }
//    }
    
}
