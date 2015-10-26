//
//  LogTableViewController.swift
//  SurfLog
//
//  Created by Alex Brashear on 10/24/15.
//  Copyright © 2015 Alex Brashear. All rights reserved.
//

import UIKit
import CoreData

class LogTableViewController: ManagedTabViewController, NSFetchedResultsControllerDelegate {
    
    let SessionLogCellIdentifier = "SessionLogCellIdentifier"
    let LogToAddEntrySegueIdentifier = "LogToAddEntrySegueIdentifier"
    var fetchedResultsController : NSFetchedResultsController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest(entityName: "Session")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.coreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action:"addButtonTapped:")
        self.tabBarController!.navigationItem.setRightBarButtonItem(addButton, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }

    func configureCell(cell: SessionTableViewCell, indexPath: NSIndexPath) {
        let session = fetchedResultsController.objectAtIndexPath(indexPath) as! Session
        cell.configureCellForSection(session)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : SessionTableViewCell = tableView.dequeueReusableCellWithIdentifier(SessionLogCellIdentifier, forIndexPath: indexPath) as! SessionTableViewCell
        configureCell(cell, indexPath: indexPath)
        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == LogToAddEntrySegueIdentifier) {
            let viewController: AddLogEntryViewController = segue.destinationViewController as! AddLogEntryViewController
            viewController.coreDataManager = self.coreDataManager
            viewController.logTableViewController = self
        } else if (segue.identifier == SessionLogCellIdentifier) {
            
        }
    }

    
    // MARK: - IBActions
    
    func addButtonTapped(sender: AnyObject?) {
        self.performSegueWithIdentifier(LogToAddEntrySegueIdentifier, sender: self)
    }
    
    // MARK: - NSFetchedResultsControllerDelegate
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)
        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
        case .Update:
            let cell = tableView.cellForRowAtIndexPath(indexPath!) as! SessionTableViewCell
            configureCell(cell, indexPath: indexPath!)
        case .Move:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }

}
