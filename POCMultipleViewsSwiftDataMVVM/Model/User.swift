//
//  User.swift
//  POCMultipleViewsSwiftDataMVVM
//
//  Created by Lais Godinho on 15/12/25.
//

import SwiftData
import Foundation

@Model
class User {
    var id = UUID()
    var name: String
    var birthdate: Date
    var email: String
    var phoneNumber: String
    var workExperience: String
    var profession: String
    var graduationSchool: String
    var graduationYear: String
    var degreeTitle: String
 
    init(name: String, birthdate: Date, email: String, phoneNumber: String, workExperience: String, profession: String, graduationSchool: String, graduationYear: String, degreeTitle: String) {
        self.name = name
        self.birthdate = birthdate
        self.email = email
        self.phoneNumber = phoneNumber
        self.workExperience = workExperience
        self.profession = profession
        self.graduationYear = graduationYear
        self.graduationSchool = graduationSchool
        self.degreeTitle = degreeTitle
    }
}
