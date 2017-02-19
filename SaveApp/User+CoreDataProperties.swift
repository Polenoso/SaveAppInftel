//
//  User+CoreDataProperties.swift
//  SaveApp
//
//  Created by Aitor Pagán on 27/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var nickname: String?
    @NSManaged var password: String?
    @NSManaged var id_user: NSNumber?

}
