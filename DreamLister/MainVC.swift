//
//  MainVC.swift
//  DreamLister
//
//  Created by sabarish sridhar on 09/03/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import UIKit
import CoreData
class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate {

    var controller : NSFetchedResultsController <Item>!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
         // generateTestData()
        attemptFetch()
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections{
        return sections.count
        }
        
        return 0;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections{
        
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func configureCell(cell:ItemCell, indexPath :NSIndexPath)
    {
        
        let item = controller.object(at: (indexPath as IndexPath) as IndexPath)
        cell.configureCell(item:item)
        
    //update cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
         if let objs = controller.fetchedObjects{
        let item = objs[indexPath.row]
            performSegue(withIdentifier: "ItemDetailsVC", sender: item)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemDetailsVC"{
            if let destination = segue.destination as? ItemDetailsVC {
                if let item = sender as? Item{
                destination.itemToEdit = item
                }
                
            }
        
        }
    }
    func attemptFetch(){
    
        let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
        let datesort = NSSortDescriptor(key: "created", ascending:false)
        fetchRequest.sortDescriptors = [datesort]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext:context , sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        
        self.controller = controller
        do{
        
        try controller.performFetch()
        }
        catch{
        let error = error as NSError
            print("\(error)")
        }
        
        
        
    }
    
    
    func generateTestData(){
    
    let item = Item(context: context)
        item.title = "Macbook Pro"
        item.price = 1800
        item.details = " I cant wait till i get my hands on this amazing laptop"
        
        
        let item2 = Item(context: context)
        item2.title = "Bose HeadPhones"
        item2.price = 300
        item2.details = " Wonderful Noise Cancellation tech!!!!"
        
        let item3 = Item(context: context)
        item3.title = "Tesla Model S"
        item3.price = 110000
        item3.details = " Waiting for you. What a spectacular car to drive "
    
    ad.saveContext()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch(type)
        {
        case.insert :
            if let indexPath = newIndexPath{
            
            tableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        case .delete:
            if let indexPath = indexPath{
            tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break;
        case.update :
            if let indexPath = indexPath{
            
            let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                
                //Update for Cell Data
                
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break;
            
            
        case.move :
            if let indexPath = indexPath{
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
            
            tableView.insertRows(at: [indexPath], with: .fade)
            }
            }
        }
    
        
    }
    



