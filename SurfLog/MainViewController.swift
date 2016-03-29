//
//  MainViewController.swift
//  SurfLog
//
//  Created by Alex Brashear on 3/21/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var coreDataManager: CoreDataManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Summary"
        let progressView = ProgressView(frame: self.view.frame)
        self.view.addSubview(progressView)
        progressView.animateProgressView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showLog" {
            if let LogTableViewController = segue.destinationViewController as? LogTableViewController {
                LogTableViewController.coreDataManager = coreDataManager
            }
        }
    }
 

}
