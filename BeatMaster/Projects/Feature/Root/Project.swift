import Foundation
import ProjectDescription
import ProjectTemplatePlugin
import DependencyPlugin


let project = Project.makeAppModule(
    name: "Root",
    bundleId: .appBundleID(name: ".Root"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .Shared(implements: .Shareds),
        .Feature(implements: .Auth)
    ],
    sources: ["Sources/**"]
)
