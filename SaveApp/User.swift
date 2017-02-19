//
//  User.swift
//  SaveApp
//
//  Created by Aitor Pagán on 27/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import Foundation
import CoreData


class User: NSManagedObject {

    @NSManaged var nickname: String?
    @NSManaged var password: String?
    @NSManaged var id_user: NSNumber?

}
