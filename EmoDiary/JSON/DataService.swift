//
//  DataService.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/19.
//

import Foundation

class DataService{
    static func getLocalEmotionsData() -> [EmotionsJson] {
        
        // Parse local json file
        // Get a url path to the json file
        // MARK: Change the JSON file name below
        let pathString = Bundle.main.path(forResource: "Emotions", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [EmotionsJson]()
        }
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            // Decode the data with a JSON decoder
            do {
                let jsonData = try JSONDecoder().decode([EmotionsJson].self, from: data)
                // Add the unique IDs
                for each in jsonData {
                    
                    each.id = UUID()
                    
                    // Return the recipes
                    return jsonData
                }
            }catch {
                // error with getting data
                print("!!")
            }
        }catch{
            print("!")
        }
        return [EmotionsJson]()
    }
    
}
