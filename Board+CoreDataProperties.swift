//
//  Board+CoreDataProperties.swift
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

extension Board {

    @NSManaged var feet: NSNumber?
    @NSManaged var inches: NSNumber?
    @NSManaged var identifier: String?

}
