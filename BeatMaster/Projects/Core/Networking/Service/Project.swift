import Foundation
import ProjectDescription
import ProjectTempletePlugin
import DependencyPlugin


let project = Project.makeAppModule(
    name: "Service",
    bundleId: .appBundleID(name: "Service"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .Networking(implements: .ThirdPartys)
    ],
    sources: ["Sources/**"]
)
