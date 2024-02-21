import Foundation
import ProjectDescription
import ProjectTempletePlugin

let project = Project.makeAppModule(
    name: "DesignSystem",
    bundleId: .appBundleID(name: ".DesignSystem"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
//        .Shared(implements: .ThirdParty)
    ],
    sources: ["Sources/**"],
    resources: ["Resources/**"]
)
