import Foundation
import ProjectDescription
import ProjectTemplatePlugin
import DependencyPackagePlugin

let project = Project.makeAppModule(
    name: "ThirdParty",
    bundleId: .appBundleID(name: ".ThirdParty"),
    product: .framework,
    settings:  .settings(),
    dependencies: [
        .SPM.composableArchitecture,
        .SPM.swinject
        
        
        
    ],
    sources: ["Sources/**"]
)
