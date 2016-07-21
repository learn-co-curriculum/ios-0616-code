//
//  List+CoreDataProperties.swift
//  playingWithCoreData
//
//  Created by Joe Burgess on 7/21/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension List {

    @NSManaged var name: String?
    @NSManaged var dueDate: NSDate?
    @NSManaged var tasks: Set<Task>

}
