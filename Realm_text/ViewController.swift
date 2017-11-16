//
//  ViewController.swift
//  Realm_text
//
//  Created by mm on 16/8/4.
//  Copyright © 2016年 mm. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let rdao = Realm_Dao()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var config = Realm.Configuration()
        
        let username = "mqhong";
        // 使用默认的目录，但是请将文件名替换为用户名
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")
        
        // 将该配置设置为默认 Realm 配置
        Realm.Configuration.defaultConfiguration = config
        
        print(config)
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Addddd(sender: AnyObject) {
        print("mqh")
        let pp = Person()
        pp.name = "mqh"

        
//         pp.id = pp.IncrementaID()
        rdao.Insert_Realm(person: pp)
        
    }
    @IBAction func Deleteddd(sender: AnyObject) {
        print(#function)
        let pp = Person()
        let realm = try! Realm()
        let RetNext: NSArray = Array(realm.objects(Person.self).sorted(byKeyPath: "birthdate")) as NSArray
        let last = RetNext.lastObject
        if (last != nil) {
            let ppid = (last as AnyObject).value(forKey:"id")
            pp.id = ppid as! String
            print("有值:\(pp.id)")
        }else{
            print("没有值")
            return
        }
        rdao.Delete_Realm(person: pp)
    }
    
    @IBAction func Updateddd(sender: AnyObject) {
        print(#function)
        
        rdao.Update_Realm()
    }
    
    @IBAction func Selectddd(sender: AnyObject) {
        print(#function)
        rdao.SelectAll_Realm()
    }
    
    
    @IBAction func Delete_All_ddd(sender: AnyObject) {
        rdao.DeleteAll_Realm()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

