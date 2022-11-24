//
//  EmotionsViewModel.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/19.
//

import Foundation

class EmotionsViewModel:ObservableObject{
    // Reference to the managed object context
    let managedObjectContext = PersistenceController.shared.container.viewContext
    
    @Published var emotions = [EmotionsJson]()
    
    init(){
        checkLoadedData()
    }
    
    // MARK: Check and preload JSON data
    func checkLoadedData(){
        // Check local storage for the flag
        
        let status = UserDefaults.standard.bool(forKey: Constants.isDataPreloaded)
        // If it's false, then we should parse the local json and preload into Core Data
        
        if status == false{
            preloadLocalData()
            
        }
    }
    
    func preloadLocalData(){
        let emotionsJson = DataService.getLocalEmotionsData()
        
        
        for each in emotionsJson{
            let coreData = Emotion(context: managedObjectContext)
            
            coreData.id = UUID()
            
            coreData.name = each.name
            coreData.emoji = each.emoji
            coreData.info = each.info
        }
        
        
        do{
            try managedObjectContext.save()
            UserDefaults.standard.setValue(true, forKey: Constants.isDataPreloaded)
        }catch{
        }
        
    }
}



