//
//  Book+CoreDataProperties.swift
//  cmpe131book
//
//  Created by 安博 on 4/13/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var author: String?
    @NSManaged public var genre: String?
    @NSManaged public var isbn: Int16
    @NSManaged public var numofpages: Int16
    @NSManaged public var publisher: String?
    @NSManaged public var rating: Double
//    @NSManaged public var readinglevel: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16

}
