//
//  AddLogEntryViewController.swift
//  SurfLog
//
//  Created by Alex Brashear on 10/24/15.
//  Copyright © 2015 Alex Brashear. All rights reserved.
//

import UIKit
import CoreData

class AddLogEntryViewController: UIViewController {
    
    @IBOutlet var surfSpotField: UITextField!
    @IBOutlet var timeInWaterField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var timeOfDaySegmentedControl: UISegmentedControl!
    @IBOutlet var submitButton: UIButton!
    var coreDataManager: CoreDataManager!
    var logTableViewController : LogTableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK - IBActions
    
    @IBAction func submitButtonTapped(sender: UIButton) {
        let session = NSEntityDescription.insertNewObjectForEntityForName("Session", inManagedObjectContext: coreDataManager.context) as! Session
        session.spot = surfSpotField.text
        session.date = datePicker.date
        session.timeInWater = 1.5
        coreDataManager.saveContext()
        self.dismissViewControllerAnimated(true) { () -> Void in
            self.logTableViewController.tableView.reloadData()
        }
    }

}
