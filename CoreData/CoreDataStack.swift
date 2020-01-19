//
//  CoreDataStack.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/29/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack: NSObject {
    
    static let shared = CoreDataStack()
    
    let modelName = "GundamMobile"
    
    lazy var context: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "GundamMobile")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var items: [NSManagedObject] = []
    var Gachas: [NSManagedObject] = []
    
    // MARK: - Core Data operations
    
    func update(){
        updateItem()
         updateGacha()
    }
    
    func updateItem() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Gundam")
        do {
            items = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch requested item. \(error), \(error.userInfo)")
        }
    }
    
    func updateItembysortHtoL(){
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Gundam")
        let sort = NSSortDescriptor(key: "cost", ascending: false)
        fetchRequest.sortDescriptors = [sort]
        do {
            items = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch requested item. \(error), \(error.userInfo)")
        }
    }
    
    func updateItembysortLtoH(){
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Gundam")
        let sort = NSSortDescriptor(key: "cost", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        do {
            items = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch requested item. \(error), \(error.userInfo)")
        }    }
    
    func saveItem(name: String,cost: String,image: NSData) {
        
        if let entity = NSEntityDescription.entity(forEntityName: "Gundam", in: context) {
            let item = NSManagedObject(entity: entity, insertInto: context)
            
            item.setValue(name, forKeyPath: "name")
            item.setValue(cost, forKeyPath: "cost")
            item.setValue(image, forKeyPath: "image")
            
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save the item. \(error), \(error.userInfo)")
            }
        }
        updateItem()
    }
    
    func deleteItem(item: Gundam) {
        if let _ = items.firstIndex(of: item)  {
            context.delete(item)
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not delete the item. \(error), \(error.userInfo)")
            }
        }
        updateItem()
    }
    
    func updateGacha() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Gacha")
        do {
            Gachas = try context.fetch(fetchRequest)
            print(Gachas.count)
        } catch let error as NSError {
            print("Could not fetch requested gacha item. \(error), \(error.userInfo)")
        }
    }
    
    func deleteGacha(item: Gacha) {
        if let _ = Gachas.firstIndex(of: item)  {
            context.delete(item)
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not delete the item. \(error), \(error.userInfo)")
            }
        }
        updateGacha()
    }
    
    func deleteallItem(){
        for item in items{
            
            deleteItem(item: item as! Gundam)
            print("Deleting")
            print(items.count)
        }
    }
    
    func deleteall(){
        for gacha in Gachas{
            
            deleteGacha(item: gacha as! Gacha)
            print("Deleting")
            print(Gachas.count)
        }
        
    }
    
    func saveGacha(vol73pool: Array<String>,vol74pool: Array<String>,vol75pool: Array<String>) {
        
        if let entity = NSEntityDescription.entity(forEntityName: "Gacha", in: context) {
            let item = NSManagedObject(entity: entity, insertInto: context)
            
            item.setValue(vol73pool, forKeyPath: "vol73pool")
            item.setValue(vol74pool, forKeyPath: "vol74pool")
            item.setValue(vol75pool, forKeyPath: "vol75pool")
            
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save the gacha item. \(error), \(error.userInfo)")
            }
        }
        updateGacha()
    }
    
    
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

