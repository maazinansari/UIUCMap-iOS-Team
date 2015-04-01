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

    let eventsManager = EventsManager()
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        
        if segue.identifier == "DoneEvent"{
            let addEventController = segue.sourceViewController as AddEventViewController
            if let newEvent = addEventController.newEvent {
                eventsManager.createdEvents += [newEvent]
                eventsManager.save()
                let indexPath = NSIndexPath(forRow: eventsManager.createdEvents.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath],
                    withRowAnimation: .Automatic)
            }
        }
        
    }
    
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            return eventsManager.createdEvents.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        let event = eventsManager.createdEvents[indexPath.row]
        cell.textLabel?.text =  event.name
        
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
