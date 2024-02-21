import Foundation
import ProjectDescription
import ProjectTemplatePlugin


let project = Project.makeAppModule(
    name: "BPMCounter",
    bundleId: .appBundleID(name: ".BPMCounter"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        
    ],
    sources: ["Sources/**"]
)
