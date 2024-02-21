import Foundation
import ProjectDescription
import ProjectTemplatePlugin
import DependencyPackagePlugin


let project = Project.makeAppModule(
    name: "DiContainer",
    bundleId: .appBundleID(name: ".DiContainer"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .SPM.swinject
    ],
    sources: ["Sources/**"]
)
