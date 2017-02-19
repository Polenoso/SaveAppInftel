//
//  incomesViewController.swift
//  SaveApp
//
//  Created by noussair el harrak on 23/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit
import CoreData

class inoutTableViewController: UITableViewController {
    
    let incomeFacade = IncomesFacade()
    let outgoesFacade = OutgoesFacade()
    let userFacade = UserFacade()

    var outgo: Bool?
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var addIncomeButton: UIBarButtonItem!
    @IBOutlet weak var addOutgoButton: UIBarButtonItem!
    
    var incomes = [Incomes]()
    var outgoes = [Outgoes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if outgo == true{
            navigationBar.rightBarButtonItems?.removeFirst()

        }else if outgo == false{
            navigationBar.rightBarButtonItems?.popLast()

        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if outgo == true{
            outgoes = outgoesFacade.getOutgoes()
        }else if outgo == false{
            incomes = incomeFacade.getIncomes(userFacade.getIdUser())
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
    }
    
    
    //MARK: Cell Configuration
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if outgo == true {
            return outgoes.count
        }else{
           return incomes.count
        }
    }
    
    @IBAction func unwindToAddIncomeList(sender: UIStoryboardSegue) {
        
        incomes = incomeFacade.getIncomes(userFacade.getIdUser())
        
        tableView.reloadData()
        
        
    }
    
    @IBAction func unwindToAddOutgoList(sendeR: UIStoryboardSegue){
        
        outgoes = outgoesFacade.getOutgoes()
        
        tableView.reloadData()
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "inoutCellView"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! inoutTableViewCell
        
        if outgo == true{
            
            let outgo = outgoes[indexPath.row]
            
            if outgo.type == "Fijo"{
//                cell.conceptTextLabel.textColor = UIColor.redColor()
//                cell.quantityTextLabel.textColor = UIColor.redColor()
//                cell.dateTextLabel.textColor = UIColor.redColor()
                
                cell.backgroundColor = UIColor(red: 0.88, green: 0.0, blue: 0.2, alpha: 0.6)
            }else if outgo.type == "Variable"{
                cell.backgroundColor = UIColor(red: 0.0, green: 0.8, blue: 0.2, alpha: 0.6)
            }
            
            cell.conceptTextLabel.text = outgo.concept
            cell.quantityTextLabel.text = outgo.quantity?.stringValue
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            cell.dateTextLabel.text = dateFormatter.stringFromDate(outgo.dateOutgo!)
            
        }else if outgo == false{//If we want to see incomes
            
            let income = incomes[indexPath.row]
            
            cell.conceptTextLabel.text = income.concept
            cell.quantityTextLabel.text = income.quantity?.stringValue
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            cell.dateTextLabel.text = dateFormatter.stringFromDate(income.dateIncome!)
            
        }
        
        // Configure the cell...
        
        return cell
    }
    
    //Other funcs
    

    
    

}
