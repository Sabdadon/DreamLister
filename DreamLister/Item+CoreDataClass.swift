//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by sabarish sridhar on 09/03/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }

}
