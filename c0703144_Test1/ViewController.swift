//
//  ViewController.swift
//  c0703144_Test1
//
//  Created by swathi santi on 2017-07-13.
//  Copyright © 2017 swathi santi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var passlbl: UILabel!
    @IBOutlet var passtxt: UITextField!
    @IBOutlet var nametxt: UITextField!
    @IBOutlet var namelbl: UILabel!
    override func viewDidLoad() {
        
        var username = self.nametxt.text
        var password = self.passtxt.text
        if(username == nametxt.text && password == passtxt.text){
         ("login  sucessful")
        }else{
            ("login failed")
        }
        super.viewDidLoad()
        
        
               // Do any additional setup after loading the view, typically from a nib.
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Users",
                                       in: managedContext)!
        
        let Users = NSManagedObject(entity: entity,
                                      insertInto: managedContext)
        
        // 3
        Users.setValue("swathi", forKeyPath: "username")
        Users.setValue("abhi123", forKeyPath: "password")
        
        // 4
        do {
            try managedContext.save()
            print("Record Inserted")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Users")
        
        //3
        var allStudents: [NSManagedObject] = []
        do {
            allStudents = try managedContext.fetch(fetchRequest)
            
            for m in allStudents
            {
                print((m as! Users).username!)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        
    }
    
    @IBOutlet var btn: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


