import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin


let project = Project.makeAppModule(
    name: "DiContainer",
    bundleId: .appBundleID(name: ".DiContainer"),
    product: .staticLibrary,
    settings: .appBaseLibraySetting(appName: "DiContainer"),
    dependencies: [
        .Networking(implements: .Service)
    ],
    sources: ["Sources/**"]
)
