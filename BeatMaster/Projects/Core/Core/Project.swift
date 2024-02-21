import Foundation
import ProjectDescription
import ProjectTemplatePlugin
import DependencyPlugin

let project = Project.makeAppModule(
    name: "Core",
    bundleId: .appBundleID(name: ".Core"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .Core(implements: .Authorization),
        .Feature(implements: .BPMCounter),
        .Feature(implements: .Metronome),
        .Feature(implements: .Splash),
        .Feature(implements: .Root)
    ],
    sources: ["Sources/**"]
)
