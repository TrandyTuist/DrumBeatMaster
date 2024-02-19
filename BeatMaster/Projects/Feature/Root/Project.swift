import Foundation
import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "Root",
    bundleId: .appBundleID(name: ".Root"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .Shared(implements: .Shareds)
    ],
    sources: ["Sources/**"]
)