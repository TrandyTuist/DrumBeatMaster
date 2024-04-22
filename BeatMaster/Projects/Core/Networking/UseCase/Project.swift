import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin
import DependencyPackagePlugin

let project = Project.makeAppModule(
    name: "UseCase",
    bundleId: .appBundleID(name: ".UseCase"),
    product: .staticFramework,
    settings:  .settings(),
    dependencies: [
        .Networking(implements: .Service),
        .Networking(implements: .Model),
        .Networking(implements: .ThirdPartys)
    ],
    sources: ["Sources/**"],
    infoPlist: .file(path: Path.relativeToRoot("Projects/Support/Info.plist"))
)
