import Foundation
import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "Splash",
    bundleId: .appBundleID(name: ".Splash"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .Shared(implements: .Shareds)
    ],
    sources: ["Sources/**"]
)
