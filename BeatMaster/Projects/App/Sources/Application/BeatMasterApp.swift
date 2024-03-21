import SwiftUI
//import Auth
import ComposableArchitecture

@main
struct BeatMasterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(
                store:
                    Store(
                        initialState: AppFeature.State(),
                        reducer: {
                            AppFeature()
                                ._printChanges()
                        }
                    )
            )
        }
    }
    
    private func registerDependencies() {
        AppDIContainer.shared.registerDependencies()
    }
}
