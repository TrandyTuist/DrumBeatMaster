import Foundation
import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

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
