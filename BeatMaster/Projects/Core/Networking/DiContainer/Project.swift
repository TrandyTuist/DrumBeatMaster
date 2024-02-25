import Foundation
import ProjectDescription
import ProjectTemplatePlugin
import DependencyPackagePlugin


let project = Project.makeAppModule(
    name: "DiContainer",
    bundleId: .appBundleID(name: ".DiContainer"),
    product: .staticFramework,
    settings: .appBaseSetting(appName: "DiContainer"),
    dependencies: [
        .SPM.swinject
    ],
    sources: ["Sources/**"]
)
