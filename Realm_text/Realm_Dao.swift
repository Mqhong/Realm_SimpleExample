//
//  Realm_Dao.swift
//  Realm_text
//
//  Created by mm on 16/8/4.
//  Copyright © 2016年 mm. All rights reserved.
//

import UIKit
import RealmSwift

public class Realm_Dao: NSObject {
 
    
    
    /**
     增加
     
     :param: person
     */
    func Insert_Realm(person:Person){
        
        let author = person
        let realm = try! Realm()
        
        try! realm.write({
            realm.add(author)
            print("插入成功")
        })
    }
    
    /**
     删除单个
     
     :param: person
     */
    func Delete_Realm(person:Person){
        
            let realm = try! Realm()
        print(realm.object(ofType: Person.self, forPrimaryKey: person.id as AnyObject) as Any)
            try! realm.write({
                realm.delete(realm.object(ofType: Person.self, forPrimaryKey: person.id as AnyObject)!)
            })
    }
    
    
    /**
     全部删除
     */
    func DeleteAll_Realm(){
        let realm = try! Realm()
        try! realm.write({
            realm.deleteAll()
            print("全部删除了哟")
        })
    }
    
    
    /**
     更新
     
     :param: person <#person description#>
     :param: name   <#name description#>
     */
    func Update_Realm(){
        let realm = try! Realm()
        let person = Person()
        person.name = "孟庆洪"
        person.id = "6FA81311-812F-4BED-8373-7FE10D84D65B"
        try! realm.write({
            realm.add(person,update: true)
            print("修改成功")
        })
    }
    
    func SelectAll_Realm(){
        let realm = try! Realm()
        
        let allPer = realm.objects(Person.self) //单独使用时遍历全部Person
        print("打印所有\n")
        if allPer.count != 0 {
            for pp in allPer {
                let ddd = pp as Person
                print(ddd)
            }
        }
        
        print("\n根据条件来查找")
        
        let personid = "6FA81311-812F-4BED-8373-7FE10D84D65B"
        
        let predicate = NSPredicate(format: "id = '\(personid)'")
        let person = realm.objects(Person.self).filter(predicate)
        print(person)
        if person.count != 0 {
            for pp in person {
                let ddd = pp as Person
                print(ddd)
            }
        }
//        // 使用断言字符串查询
//        var tanDogs = realm.objects(Dog).filter("color = '棕黄色' AND name BEGINSWITH '大'")
//        // 使用 NSPredicate 查询
//        let predicate = NSPredicate(format: "color = %@ AND name BEGINSWITH %@", "棕黄色", "大")
//        tanDogs = realm.objects(Dog).filter(predicate)
    }
    
    
    
    
    
    
}
