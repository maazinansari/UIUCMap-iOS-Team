//
//  Events.swift
//  Test1
//
//  Created by Ignatius Ian on 27/3/15.
//  Copyright (c) 2015 Ignatius Ian. All rights reserved.
//

import Foundation
import UIKit

class Events: NSObject, NSCoding {
    
    let NameKey = "NameKey"
    let AddressKey = "AddressKey"
    let DateKey = "DateKey"
    let EventURLKey = "EventURLKey"
    
    let name : String
    let address : String
    let date : String
    let eventURL: String
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(NameKey) as String
        address = aDecoder.decodeObjectForKey(AddressKey) as String
        date = aDecoder.decodeObjectForKey(DateKey) as String
        eventURL = aDecoder.decodeObjectForKey(EventURLKey) as String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: NameKey)
        aCoder.encodeObject(address, forKey: AddressKey)
        aCoder.encodeObject(date, forKey: DateKey)
        aCoder.encodeObject(eventURL, forKey: EventURLKey)
    }
    
    init (name: String, address: String, date: String, eventURL : String){
        self.name = name
        self.address = address
        self.date = date
        self.eventURL = eventURL
    }
    
    
    
}
