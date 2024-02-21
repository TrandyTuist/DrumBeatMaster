import Foundation
import ProjectDescription
import ProjectTempletePlugin
import DependencyPackagePlugin

let project = Project.makeAppModule(
    name: "ThirdParty",
    bundleId: .appBundleID(name: ".ThirdParty"),
    product: .framework,
    settings:  .settings(),
    dependencies: [
        .SPM.ComposableArchitecture,
        .SPM.Swinject
        
        
        
    ],
    sources: ["Sources/**"]
)
