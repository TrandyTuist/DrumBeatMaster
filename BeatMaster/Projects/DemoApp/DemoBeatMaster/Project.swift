import Foundation
import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "DemoBeatMaster",
    bundleId: .appBundleID(name: ".Demo"),
    product: .app,
    settings:  .appDemoSetting,
    dependencies: [
        .Core(implements: .Core),
        .Shared(implements: .Shareds),
        .Networking(implements: .Networkings)
    ],
    sources: ["Sources/**"],
    resources: ["Resources/**", "Resources/FontAsset/**"],
    infoPlist: .file(path: "Support/Info.plist"),
    entitlements: .file(path: "Entitlements/BeatMasterDemo.entitlements")
    
)
