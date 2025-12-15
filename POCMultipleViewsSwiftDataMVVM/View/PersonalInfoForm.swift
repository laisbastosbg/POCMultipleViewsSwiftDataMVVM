//
//  PersonalInfoForm.swift
//  POCMultipleViewsSwiftDataMVVM
//
//  Created by Lais Godinho on 15/12/25.
//

import SwiftUI

struct PersonalInfoForm: View {
    @StateObject var viewModel = UserDataViewModel.shared
    
    var body: some View {
        VStack {
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)
            DatePicker("Data de Nascimento", selection: $viewModel.birthdate, displayedComponents: .date)
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
            TextField("Celular", text: $viewModel.phoneNumber)
                .textFieldStyle(.roundedBorder)
        }
        .padding(20)
        .navigationTitle(Text("Dados Pessoais"))
    }
}

#Preview {
    PersonalInfoForm()
}
