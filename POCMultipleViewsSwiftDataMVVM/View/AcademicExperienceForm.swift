//
//  AcademicExperienceForm.swift
//  POCMultipleViewsSwiftDataMVVM
//
//  Created by Lais Godinho on 15/12/25.
//

import SwiftUI

struct AcademicExperienceForm: View {
    @StateObject var viewModel = UserDataViewModel.shared
    
    var body: some View {
        VStack {
            TextField("Graduation School", text: $viewModel.graduationSchool)
                .textFieldStyle(.roundedBorder)
            TextField("Graduation Year", text: $viewModel.graduationYear)
                .textFieldStyle(.roundedBorder)
            TextField("Degree", text: $viewModel.degreeTitle)
                .textFieldStyle(.roundedBorder)
        }
        .padding(20)
        .navigationTitle(Text("Experiência Acadêmica"))
    }
}

#Preview {
    AcademicExperienceForm()
}
