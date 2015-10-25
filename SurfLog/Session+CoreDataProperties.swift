//
//  Session+CoreDataProperties.swift
//  SurfLog
//
//  Created by Alex Brashear on 10/24/15.
//  Copyright © 2015 Alex Brashear. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Session {

    @NSManaged var additionalNotes: String?
    @NSManaged var conditions: String?
    @NSManaged var date: NSDate?
    @NSManaged var height: String?
    @NSManaged var picture: NSData?
    @NSManaged var rating: NSNumber?
    @NSManaged var timeInWater: NSDecimalNumber?
    @NSManaged var timeOfDay: String?
    @NSManaged var waterTemp: NSNumber?
    @NSManaged var wavesSurfed: NSNumber?
    @NSManaged var spot: String?

}
