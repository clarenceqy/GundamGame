//
//  Gundam+CoreDataProperties.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/30/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//
//

import Foundation
import CoreData


extension Gundam {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Gundam> {
        return NSFetchRequest<Gundam>(entityName: "Gundam")
    }

    @NSManaged public var name: String?
    @NSManaged public var cost: String?
    @NSManaged public var image: NSData?

}
