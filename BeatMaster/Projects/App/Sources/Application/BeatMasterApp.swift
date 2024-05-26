import SwiftUI
//import Auth
import KakaoSDKCommon
import KakaoSDKAuth
import KeychainAccess

import ComposableArchitecture

@main
struct BeatMasterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var isDeleteApp = UserDefaults.standard.string(forKey: "isDelete")
    
    init() {
        initializeKakao()
        registerDependencies()
        isDeleteApplication()
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
                                ._printChanges(.actionLabels)
                        }
                    )
            )
            .onOpenURL { url in
                if AuthApi.isKakaoTalkLoginUrl(url) {
                    _ = AuthController.handleOpenUrl(url: url)
                }
            }
        }
    }
    
    private func registerDependencies() {
        Task {
            await AppDIContainer.shared.registerDependencies()
        }
    }
    
    private func initializeKakao() {
        guard let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_APP_KEY"] as? String else {
            return
        }
        KakaoSDK.initSDK(appKey: kakaoAppKey)
    }
    
    private func isDeleteApplication() {
        if isDeleteApp == nil {
            try? Keychain().removeAll()
        }
    }
}
