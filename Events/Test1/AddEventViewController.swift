//
//  AddEventViewController.swift
//  Test1
//
//  Created by Ignatius Ian on 27/3/15.
//  Copyright (c) 2015 Ignatius Ian. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class AddEventViewController: UIViewController{
    
    var newEvent: Events?
    var databasePath = NSString()
    let dateFormatter = NSDateFormatter()
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventAddressLabel: UILabel!
    @IBOutlet weak var eventAddress: UITextField!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventDate: UITextField!
    @IBOutlet weak var eventURLLabel: UILabel!
    @IBOutlet weak var eventURL: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneEvent"{
            let name=eventName.text
            let address=eventAddress.text
            let date=eventDate.text
            let url=eventURL.text
            if (!name.isEmpty && !address.isEmpty && !date.isEmpty){
                //let date2 = dateFormatter.dateFromString(date)
                newEvent=Events(name: name, address: address, date: date, eventURL: url)
            }
            
        }
    }


        
     override func viewDidLoad(){
    
        navigationItem.title = "New Event"
        eventNameLabel.text = "Name"
        eventAddressLabel.text = "Add."
        eventDateLabel.text = "Date"
        eventURLLabel.text = "URL"
        self.eventName.becomeFirstResponder()
    }
}


