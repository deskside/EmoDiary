//
//  JsonModel.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/19.
//

import Foundation

class EmotionsJson:Codable,Identifiable{
    var id: UUID?
    var emotionName:String
}
