//
//  Incomes.swift
//  SaveApp
//
//  Created by Aitor Pagán on 25/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import Foundation
import CoreData

@objc(Incomes)
class Incomes: NSManagedObject {

    @NSManaged var concept: String?
    @NSManaged var quantity: NSNumber?
    @NSManaged var dateIncome: NSDate?
    @NSManaged var id_Income: NSNumber?
    
    func newIncome(concept: String, quantity: NSNumber, dateIncome: NSDate, id_Income: NSNumber) -> Incomes{
        self.concept = concept
        self.quantity = quantity
        self.dateIncome = dateIncome
        self.id_Income = id_Income
        
        return self as Incomes
    }

}
