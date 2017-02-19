//
//  outgoesFacade.swift
//  SaveApp
//
//  Created by Aitor Pagán on 26/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class OutgoesFacade{
    
    //static var total: Float = 0.0
    
    let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    func saveOutgo (concept: String, quantity: Float?, dateOutgo: NSDate, type: String){
        
        let outgo = NSEntityDescription.insertNewObjectForEntityForName("Outgoes", inManagedObjectContext: managedContext) as! Outgoes
        
        outgo.concept = concept
        outgo.quantity = quantity
        outgo.dateOutgo = dateOutgo
        outgo.type = type
        try! managedContext.save()
        
    }
    
    
    func getOutgoes() -> [Outgoes]{
        
        let fetchRequest = NSFetchRequest(entityName: "Outgoes")
        
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [Outgoes]
        
        return results
        
    }
    
    func getTotal() -> Float{
        
        let fetchRequest = NSFetchRequest(entityName: "Outgoes")
        
        let result = try! managedContext.executeFetchRequest(fetchRequest) as! [Outgoes]
        
        var i = 0
        var total: Float = 0.0
        
        
        for (i=0; i < result.count; i++){
            total = total + (result[i].quantity?.floatValue)!
        }
        
        return total
        
    }
    
    
}