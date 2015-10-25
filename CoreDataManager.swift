//
//  CoreDataStack.swift
//  SurfLog
//
//  Created by Alex Brashear on 10/18/15.
//  Copyright © 2015 Alex Brashear. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let modelName = "SurfLog"
    
    private lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    lazy var context: NSManagedObjectContext = {
        var managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.psc
        return managedObjectContext
    }()
    
    private lazy var psc: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent(self.modelName)
        
        do {
            let options = [NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true]
            
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: options)
        } catch {
            print("Error Adding persistent store.")
        }
        
        return coordinator
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource(self.modelName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            }
            catch let error as NSError {
                print("Error: \(error.localizedDescription)")
                abort()
            }
        }
    }
}


