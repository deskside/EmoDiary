//
//  Emotion+CoreDataProperties.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/24.
//
//

import Foundation
import CoreData
import SwiftUI

extension Emotion {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emotion> {
        return NSFetchRequest<Emotion>(entityName: "Emotion")
    }
    
    @NSManaged public var emoji: String?
    @NSManaged public var id: UUID?
    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var color: String?
    @NSManaged public var record: NSSet?
    
    public var recordArray: [Record]{
        let set = record as? Set<Record> ?? []
        
        return set.sorted {
            $0.timestamp ?? Date() < $1.timestamp ?? Date()
        }
    }
    
    public var wrappedEmoji:String{
        emoji ?? "🈚️"
    }
    
    public var wrappedInfo:String{
        info ?? "No further description"
    }
    
    public var wrappedName:String{
        name ?? "No name"
    }
    
    public var wrappedColor:Color{
        Color(hexadecimal: color ?? "F6C445")
    }
    
}

// MARK: Generated accessors for record
extension Emotion {
    
    @objc(addRecordObject:)
    @NSManaged public func addToRecord(_ value: Record)
    
    @objc(removeRecordObject:)
    @NSManaged public func removeFromRecord(_ value: Record)
    
    @objc(addRecord:)
    @NSManaged public func addToRecord(_ values: NSSet)
    
    @objc(removeRecord:)
    @NSManaged public func removeFromRecord(_ values: NSSet)
    
}

extension Emotion : Identifiable {
    
}
