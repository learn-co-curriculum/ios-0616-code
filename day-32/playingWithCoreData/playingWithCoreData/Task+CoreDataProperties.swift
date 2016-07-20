//
//  Task+CoreDataProperties.swift
//  playingWithCoreData
//
//  Created by Joe Burgess on 7/20/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var content: String?

}
