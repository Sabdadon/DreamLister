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
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func attemptFetch(){
    
        let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
        let datesort = NSSortDescriptor(key: "created", ascending:false)
        fetchRequest.sortDescriptors = [datesort]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext:context , sectionNameKeyPath: nil, cacheName: nil)
        
        do{
        
        try controller.performFetch()
        }
        catch{
        let error = error as NSError
            print("\(error)")
        }
        
        
        
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
    



