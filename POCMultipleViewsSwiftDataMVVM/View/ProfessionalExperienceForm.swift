//
//  ProfessionalExperienceForm.swift
//  POCMultipleViewsSwiftDataMVVM
//
//  Created by Lais Godinho on 15/12/25.
//

import SwiftUI

struct ProfessionalExperienceForm: View {
    @StateObject var viewModel = UserDataViewModel.shared
    
    var body: some View {
        VStack {
            TextField("Profissão", text: $viewModel.profession)
                .textFieldStyle(.roundedBorder)
            HStack {
                Text("Experiência profissional")
                Spacer()
            }
            TextEditor(text: $viewModel.workExperience)
                .border(.gray, width: 1)
        }
        .padding(20)
        .navigationTitle(Text("Experiência profissional"))
    }
}

#Preview {
    ProfessionalExperienceForm()
}
