import Foundation
import ProjectDescription
import ProjectTemplatePlugin
import DependencyPackagePlugin
import DependencyPlugin


let project = Project.makeAppModule(
    name: "BPMCounter",
    bundleId: .appBundleID(name: ".BPMCounter"),
    product: .staticFramework,
    settings: .appBaseSetting(appName: "BPMCounter"),
    dependencies: [
        .Shared(implements: .Shareds),
        .Networking(implements: .Networkings)
    ],
    sources: ["Sources/**"]
)
