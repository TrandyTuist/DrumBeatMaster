import Foundation
import ProjectDescription
import ProjectTemplatePlugin
import DependencyPackagePlugin

let project = Project.makeAppModule(
    name: "ThirdParty",
    bundleId: .appBundleID(name: ".ThirdParty"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .SPM.composableArchitecture,
        .SPM.sdwebImage,
        .SPM.swiftJWT
//        .SPM.supabase
    ],
    sources: ["Sources/**"]
)
