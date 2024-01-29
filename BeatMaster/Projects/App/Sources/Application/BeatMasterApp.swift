import SwiftUI
import Auth

@main
struct BeatMasterApp: App {
    
    
    init() {
        registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func registerDependencies() {
        AppDIContainer.shared.registerDependencies()
    }
}
