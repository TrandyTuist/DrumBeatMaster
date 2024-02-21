import Foundation
import ProjectDescription
import ProjectTempletePlugin


let project = Project.makeAppModule(
    name: "Metronome",
    bundleId: .appBundleID(name: ".Metronome"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        
    ],
    sources: ["Sources/**"]
)
