//
//  Dog.swift
//  Realm_text
//
//  Created by mm on 16/8/4.
//  Copyright © 2016年 mm. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {
    dynamic var id = NSUUID().uuidString
    dynamic var name = ""
    dynamic var owner: Person? //属性可以设置为可选
    override static func primaryKey() -> String?{
        return "id"
    }
    
//    func IncrementaID() -> Int {
//        let realm = try! Realm()
//        let RetNext: NSArray = Array(realm.objects(Dog).sorted("id"))
//        let last = RetNext.lastObject
//        if RetNext.count > 0 {
//            let valor = last?.valueForKey("id") as? Int
//            return valor! + 1
//        } else {
//            return 1
//        }
//    }
}
