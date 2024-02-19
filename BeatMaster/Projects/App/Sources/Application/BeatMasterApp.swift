import SwiftUI
//import Auth
import ComposableArchitecture

@main
struct BeatMasterApp: App {
    
    
    init() {
        registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: Store(initialState: AppFeature.State(), reducer: {
                AppFeature()
            }))
        }
    }
    
    private func registerDependencies() {
        AppDIContainer.shared.registerDependencies()
    }
}
