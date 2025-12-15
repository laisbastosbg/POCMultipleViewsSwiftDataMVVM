# POCMultipleViewsSwiftDataMVVM

Este repositório é uma PoC que demonstra como gerenciar os dados de um formulário dividido em múltiplas views usando SwiftUI + SwiftData em padrão MVVM.

Arquivos principais:
- [`CreateProfile`](POCMultipleViewsSwiftDataMVVM/View/CreateProfile.swift) — tela principal do formulário.
- [`PersonalInfoForm`](POCMultipleViewsSwiftDataMVVM/View/PersonalInfoForm.swift), [`AcademicExperienceForm`](POCMultipleViewsSwiftDataMVVM/View/AcademicExperienceForm.swift), [`ProfessionalExperienceForm`](POCMultipleViewsSwiftDataMVVM/View/ProfessionalExperienceForm.swift) — sub-views do formulário.
- [`UserDataViewModel.shared`](POCMultipleViewsSwiftDataMVVM/ViewModel/UserDataViewModel.swift) — view model compartilhado entre as sub-views.
- [`UserRepository`](POCMultipleViewsSwiftDataMVVM/Model/UserRepository.swift) — repositório que interage com o `ModelContext`.
- [`User`](POCMultipleViewsSwiftDataMVVM/Model/User.swift) — modelo SwiftData anotado com `@Model`.
- [`POCMultipleViewsSwiftDataMVVMApp`](POCMultipleViewsSwiftDataMVVM/POCMultipleViewsSwiftDataMVVMApp.swift) — cria o `ModelContainer` e injeta o container na cena.

Fluxo passo a passo:

1. Inicialização do app
   - O app constrói o `ModelContainer` em [`POCMultipleViewsSwiftDataMVVMApp`](POCMultipleViewsSwiftDataMVVM/POCMultipleViewsSwiftDataMVVMApp.swift). O `Schema` inclui o modelo [`User`](POCMultipleViewsSwiftDataMVVM/Model/User.swift) e a configuração atual não é apenas em memória (isStoredInMemoryOnly: false).

2. Tela principal: CreateProfile
   - A view [`CreateProfile`](POCMultipleViewsSwiftDataMVVM/View/CreateProfile.swift) utiliza:
     - `@Environment(\.modelContext) var modelContext` — contexto do SwiftData provido pelo `ModelContainer`.
     - `@StateObject var viewModel = UserDataViewModel.shared` — singleton que mantém os campos do formulário.
     - `@Query var users: [User]` — fornece a lista atual de usuários persistidos.
   - A `NavigationStack` contém `NavigationLink`s que abrem as sub-views do formulário.

3. Edição dos campos (multiplas views)
   - Cada sub-view (`PersonalInfoForm`, `AcademicExperienceForm`, `ProfessionalExperienceForm`) declara:
     - `@StateObject var viewModel = UserDataViewModel.shared`
   - Todas elas leem/escrevem propriedades do mesmo objeto singleton (`UserDataViewModel.shared`), portanto alterações feitas em uma view ficam disponíveis para as outras sem necessidade de passagem explícita de dados.

4. Criação / persistência do usuário
   - Ao tocar no botão "Criar Usuário" em [`CreateProfile`](POCMultipleViewsSwiftDataMVVM/View/CreateProfile.swift):
     - É criado `UserRepository(modelContext: modelContext)` ([`UserRepository`](POCMultipleViewsSwiftDataMVVM/Model/UserRepository.swift)).
     - Chama-se `repository.add(user: viewModel.getUser())`. O `getUser()` transforma o estado do view model em uma instância de [`User`](POCMultipleViewsSwiftDataMVVM/Model/User.swift).
     - `UserRepository.add` insere o objeto no `modelContext` (`modelContext.insert(user)`), e SwiftData persiste o dado no `ModelContainer`.
   - Como [`CreateProfile`](POCMultipleViewsSwiftDataMVVM/View/CreateProfile.swift) usa `@Query var users: [User]`, a lista na UI é atualizada automaticamente quando o `modelContext` muda.

5. Observações e boas práticas
   - O padrão usado aqui é simples e funcional para PoC: um view model singleton compartilha o estado do formulário entre várias telas.
   - Em apps maiores, considere passar o view model por injeção de dependência (EnvironmentObject) para controlar ciclo de vida e testes.
   - Para remover/atualizar usuários, implemente métodos no [`UserRepository`](POCMultipleViewsSwiftDataMVVM/Model/UserRepository.swift) que usem o `modelContext.delete(_:)` e commit se necessário.
   - Se quiser dados somente em memória para testes rápidos, altere `isStoredInMemoryOnly` em [`POCMultipleViewsSwiftDataMVVMApp`](POCMultipleViewsSwiftDataMVVM/POCMultipleViewsSwiftDataMVVMApp.swift) para `true`.

Como executar
1. Abra o projeto no Xcode: `POCMultipleViewsSwiftDataMVVM.xcodeproj`.
2. Selecione um simulador ou dispositivo e rode o app.
3. Navegue entre "Dados Pessoais", "Experiência Acadêmica" e "Experiência Profissional", preencha os campos e toque em "Criar Usuário". O usuário criado aparecerá na lista fornecida por `@Query` em [`CreateProfile`](POCMultipleViewsSwiftDataMVVM/View/CreateProfile.swift).
