//
//  Record+CoreDataProperties.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/24.
//
//

import Foundation
import CoreData


extension Record {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Record> {
        return NSFetchRequest<Record>(entityName: "Record")
    }

    @NSManaged public var feelings: String?
    @NSManaged public var id: UUID?
    @NSManaged public var timestamp: Date?
    @NSManaged public var emotion: Emotion
    
        public var wrappedFeelings:String{
            feelings ?? "No feelings"
        }
    
        public var wrappedDate:Date{
            timestamp ?? Date()
        }

}

extension Record : Identifiable {

}
