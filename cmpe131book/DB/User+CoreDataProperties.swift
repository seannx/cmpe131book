//
//  User+CoreDataProperties.swift
//  cmpe131book
//
//  Created by 安博 on 4/20/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: String?
    @NSManaged public var gender: String?
    @NSManaged public var genre: String?
    @NSManaged public var length: NSDecimalNumber?
    @NSManaged public var name: String?

}
