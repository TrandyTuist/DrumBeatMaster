import Foundation
import ProjectDescription
import MyPlugin

let localHelper = LocalHelper(name: "MyPlugin")

let project = Project.makeAppModule(
    name: "ThirdPartys",
    bundleId: .appBundleID(name: ".ThirdPartys"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .SPM.CombineMoya,
        .SPM.Moya
    ],
    sources: ["Sources/**"]
)
