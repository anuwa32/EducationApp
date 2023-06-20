//
//  Book+CoreDataProperties.swift
//  EducationApp
//
//  Created by anupriya on 2023-04-18.
//
//

import Foundation
import CoreData


extension Book {

    // This function returns a fetch request for the `Book` entity.
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    //attributes of the 'Book' entry
    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var type: String?
    @NSManaged public var writer: String?
    @NSManaged public var format: String?

}

extension Book : Identifiable {

}
