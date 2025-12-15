//
//  CreateProfile.swift
//  POCMultipleViewsSwiftDataMVVM
//
//  Created by Lais Godinho on 15/12/25.
//

import SwiftUI
import SwiftData

struct CreateProfile: View {
    @Environment(\.modelContext) var modelContext
    @StateObject var viewModel = UserDataViewModel.shared
    
    @Query var users: [User]
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: PersonalInfoForm(), label: {
                HStack {
                    Spacer()
                    Text("Dados Pessoais")
                        .font(.headline)
                    Image(systemName: "person.circle.fill")
                    Spacer()
                }
                .padding(.vertical, 10)
                .border(Color.blue, width: 1)
            })
            NavigationLink(destination: AcademicExperienceForm(), label: {
                HStack {
                    Spacer()
                    Text("Experiência Acadêmica")
                        .font(.headline)
                    Image(systemName: "graduationcap.fill")
                    Spacer()
                }
                .padding(.vertical, 10)
                .border(Color.blue, width: 1)
            })
            
            NavigationLink(destination: ProfessionalExperienceForm(), label: {
                HStack {
                    Spacer()
                    Text("Experiência Profissional")
                        .font(.headline)
                    Image(systemName: "hammer.fill")
                    Spacer()
                }
                .padding(.vertical, 10)
                .border(Color.blue, width: 1)
            })
            
            Button(action: {
                let repository = UserRepository(modelContext: modelContext)
                repository.add(user: viewModel.getUser())
            }, label: {
                HStack {
                    Spacer()
                    Text("Criar Usuário").foregroundStyle(.white)
                    Spacer()
                }
                .padding(20)
                .background(.blue)
            })
        }
        .padding(20)
        
        List(users) { user in
            Text(user.name)
            Text(user.birthdate.description)
            Text(user.email)
            Text(user.phoneNumber)
            Text(user.profession)
            Text(user.workExperience)
            Text(user.graduationSchool)
        }
    }
}

#Preview {
    CreateProfile()
}
