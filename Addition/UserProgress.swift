//
//  UserProgress.swift
//  Addition
//
//  Created by john martin on 9/25/22.
//

import Foundation

let USER_DATA_KEY = "progress"

class UserProgress: ObservableObject {
    
    @Published var numberProgress: [Int] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(numberProgress) {
                UserDefaults.standard.set(encoded, forKey: USER_DATA_KEY)
            }
        }
    }
    
    init() {
        
        if let savedItems = UserDefaults.standard.data(forKey: USER_DATA_KEY) {
            
            if let decodedItems = try? JSONDecoder().decode([Int].self, from: savedItems) {
                numberProgress = decodedItems
                return
            }
        }
        
        numberProgress = [0,0,0,0,0,0,0,0,0,0,0,0]
    }
}
