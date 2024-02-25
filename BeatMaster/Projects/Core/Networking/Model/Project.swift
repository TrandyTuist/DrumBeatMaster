import Foundation
import ProjectDescription
import ProjectTemplatePlugin


let project = Project.makeAppModule(
    name: "Model",
    bundleId: .appBundleID(name: ".Model"),
    product: .staticFramework,
    settings: .appBaseSetting(appName: "Model"),
    dependencies: [
        
    ],
    sources: ["Sources/**"]
)
