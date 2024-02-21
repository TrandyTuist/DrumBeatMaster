import Foundation
import ProjectDescription
import ProjectTemplatePlugin
import DependencyPlugin

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
