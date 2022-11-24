//
//  Emotion+CoreDataProperties.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/24.
//
//

import Foundation
import CoreData


extension Emotion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emotion> {
        return NSFetchRequest<Emotion>(entityName: "Emotion")
    }

    @NSManaged public var emoji: String?
    @NSManaged public var id: UUID?
    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var record: Record?

}

extension Emotion : Identifiable {

}
