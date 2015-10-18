//
//  Session+CoreDataProperties.swift
//  SurfLog
//
//  Created by Alex Brashear on 10/18/15.
//  Copyright © 2015 Alex Brashear. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Session {

    @NSManaged var picture: NSData?
    @NSManaged var wavesSurfed: NSNumber?
    @NSManaged var height: String?
    @NSManaged var rating: NSNumber?
    @NSManaged var timeInWater: NSDecimalNumber?
    @NSManaged var waterTemp: NSNumber?
    @NSManaged var additionalNotes: String?
    @NSManaged var date: NSDate?
    @NSManaged var timeOfDay: String?
    @NSManaged var conditions: String?

}
