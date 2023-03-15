//
//  Entity+CoreDataProperties.swift
//  Netflix Project
//
//  Created by Manimaran on 2/18/23.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var emailid: String?

}

extension Entity : Identifiable {

}
