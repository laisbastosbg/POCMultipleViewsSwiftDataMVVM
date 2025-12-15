//
//  UserDataViewModel.swift
//  POCMultipleViewsSwiftDataMVVM
//
//  Created by Lais Godinho on 15/12/25.
//

import SwiftData
import Foundation

class UserDataViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var birthdate: Date = Date()
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var workExperience: String = ""
    @Published var profession: String = ""
    @Published var graduationSchool: String = ""
    @Published var graduationYear: String = ""
    @Published var degreeTitle: String = ""
    
    
    static var shared = UserDataViewModel()
    
    private init() {}
    
    func getUser() -> User {
        return User(name: name,
                    birthdate: birthdate,
                    email: email,
                    phoneNumber: phoneNumber,
                    workExperience: workExperience,
                    profession: profession,
                    graduationSchool: graduationSchool,
                    graduationYear: graduationYear,
                    degreeTitle: degreeTitle)
    }
}
