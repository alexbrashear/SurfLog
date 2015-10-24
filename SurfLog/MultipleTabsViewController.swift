//
//  MultipleTabsViewController.swift
//  SurfLog
//
//  Created by Alex Brashear on 10/24/15.
//  Copyright © 2015 Alex Brashear. All rights reserved.
//

import UIKit
import CoreData

class MultipleTabsViewController: UITabBarController {
    
    var managedContext : NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for viewController in self.viewControllers! {
            if (viewController.isKindOfClass(ManagedTabViewController)) {
                let managedTabViewController = viewController as! ManagedTabViewController
                managedTabViewController.managedContext = self.managedContext
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
