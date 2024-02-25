import Foundation
import ProjectDescription
import ProjectTemplatePlugin
import DependencyPlugin


let project = Project.makeAppModule(
    name: "Auth",
    bundleId: .appBundleID(name: ".Auth"),
    product: .staticFramework,
    settings: .appBaseSetting(appName: "Auth"),
    dependencies: [
        .Shared(implements: .Shareds)
    ],
    sources: ["Sources/**"]
)
