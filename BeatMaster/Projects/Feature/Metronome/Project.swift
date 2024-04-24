import Foundation
import ProjectDescription
import ProjectTemplatePlugin
import DependencyPackagePlugin
import DependencyPlugin

let project = Project.makeAppModule(
    name: "Metronome",
    bundleId: .appBundleID(name: ".Metronome"),
    product: .staticFramework,
    settings: .appBaseSetting(appName: "Metronome"),
    dependencies: [
        .Shared(implements: .Shareds),
        .Networking(implements: .Networkings)
    ],
    sources: ["Sources/**"]
)
