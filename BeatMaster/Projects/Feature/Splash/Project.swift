import Foundation
import ProjectDescription
import ProjectTemplatePlugin
import DependencyPlugin


let project = Project.makeAppModule(
    name: "Splash",
    bundleId: .appBundleID(name: ".Splash"),
    product: .staticFramework,
    settings: .appBaseSetting(appName: "Splash"),
    dependencies: [
        .Shared(implements: .Shareds)
    ],
    sources: ["Sources/**"]
)
