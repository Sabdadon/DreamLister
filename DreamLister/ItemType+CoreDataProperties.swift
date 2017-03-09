//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by sabarish sridhar on 09/03/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
