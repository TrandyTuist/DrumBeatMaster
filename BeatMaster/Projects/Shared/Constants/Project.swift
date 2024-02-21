import Foundation
import ProjectDescription
import ProjectTemplatePlugin

let project = Project.makeAppModule(
    name: "Constants",
    bundleId: .appBundleID(name: ".Constants"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        
    ],
    sources: ["Sources/**"]
)
