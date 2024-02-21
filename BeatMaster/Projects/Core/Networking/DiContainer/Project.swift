import Foundation
import ProjectDescription
import ProjectTempletePlugin
import DependencyPackagePlugin


let project = Project.makeAppModule(
    name: "DiContainer",
    bundleId: .appBundleID(name: ".DiContainer"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .SPM.Swinject
    ],
    sources: ["Sources/**"]
)
