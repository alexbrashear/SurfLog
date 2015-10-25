//
//  LogTableViewController.swift
//  SurfLog
//
//  Created by Alex Brashear on 10/24/15.
//  Copyright © 2015 Alex Brashear. All rights reserved.
//

import UIKit
import CoreData

class LogTableViewController: ManagedTabViewController {
    
    let SessionLogCellIdentifier = "SessionLogCellIdentifier"
    let LogToAddEntrySegueIdentifier = "LogToAddEntrySegueIdentifier"
    var fetchedResultsController : NSFetchedResultsController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest(entityName: "Session")
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedContext, sectionNameKeyPath: nil, cacheName: nil)
        
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

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(SessionLogCellIdentifier, forIndexPath: indexPath)

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == LogToAddEntrySegueIdentifier) {
            let viewController: AddLogEntryViewController = segue.destinationViewController as! AddLogEntryViewController
            viewController.managedContext = self.managedContext
        } else if (segue.identifier == SessionLogCellIdentifier) {
            
        }
    }

    
    // MARK: - IBActions
    
    func addButtonTapped(sender: AnyObject?) {
        self.performSegueWithIdentifier(LogToAddEntrySegueIdentifier, sender: self)
    }

}
