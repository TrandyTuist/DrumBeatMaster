import Foundation
import ProjectDescription
import ProjectTempletePlugin
import DependencyPlugin


let project = Project.makeAppModule(
    name: "Auth",
    bundleId: .appBundleID(name: ".Auth"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .Shared(implements: .Shareds)
    ],
    sources: ["Sources/**"]
)
