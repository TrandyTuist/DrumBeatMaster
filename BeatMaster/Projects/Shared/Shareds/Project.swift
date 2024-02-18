import Foundation
import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let settings: SettingsDictionary = [:].otherSwiftFlags("-enable-actor-data-race-checks")

let project = Project.makeAppModule(
    name: "Shareds",
    bundleId: .appBundleID(name: ".Shareds"),
    product: .staticFramework,
    settings: .settings(base: settings),
    dependencies: [
        .Shared(implements: .Constants),
        .Shared(implements: .DesignSystem),
        .Shared(implements: .ThirdParty)
    ],
    sources: ["Sources/**"]
)
