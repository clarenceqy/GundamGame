//
//  Gacha+CoreDataProperties.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/30/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//
//

import Foundation
import CoreData


extension Gacha {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Gacha> {
        return NSFetchRequest<Gacha>(entityName: "Gacha")
    }

    @NSManaged public var vol73pool: Array<String>?
    @NSManaged public var vol75pool: Array<String>?
    @NSManaged public var vol74pool: Array<String>?

}
