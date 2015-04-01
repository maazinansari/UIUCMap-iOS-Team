//
//  EventsManager.swift
//  Test1
//
//  Created by Ignatius Ian on 28/3/15.
//  Copyright (c) 2015 Ignatius Ian. All rights reserved.
//

import Foundation
import UIKit

class EventsManager {
    
    var createdEvents = [Events]()
    lazy private var archivePath: String = {
        let fileManager = NSFileManager.defaultManager()
        let documentsDirectoryURLS = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as [NSURL]
        let archiveURL = documentsDirectoryURLS.first!.URLByAppendingPathComponent("CreatedEvents", isDirectory: false)
        return archiveURL.path!
        }()
    
    func save() {
        NSKeyedArchiver.archiveRootObject(createdEvents, toFile: archivePath)
    }
    
    private func unarchivedSavedEvents() {
        if NSFileManager.defaultManager().fileExistsAtPath(archivePath)
        {
            let savedEvents = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as [Events]
            createdEvents += savedEvents
        }
    }
    
    init() {
        unarchivedSavedEvents()
    }
}
