//
//  UserRepository.swift
//  POCMultipleViewsSwiftDataMVVM
//
//  Created by Lais Godinho on 15/12/25.
//

import SwiftData

class UserRepository {
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func add(user: User) {
        modelContext.insert(user)
    }
}
