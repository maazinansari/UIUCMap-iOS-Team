//
//  EventListViewController.swift
//  Test1
//
//  Created by Ignatius Ian on 24/3/15.
//  Copyright (c) 2015 Ignatius Ian. All rights reserved.
//

import Foundation
import UIKit

class EventListViewController : UITableViewController {

    var eventsList = ["Party","Study Session","Concert"]
    
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            return eventsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text =  eventsList[indexPath.row]
        
        return cell

    }
    
    override func viewWillAppear(animated: Bool) {
        
        navigationItem.title = "Events"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
}
