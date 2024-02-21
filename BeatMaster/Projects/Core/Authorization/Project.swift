import ProjectDescription
import ProjectTempletePlugin
import DependencyPlugin

let project = Project.makeAppModule(
    name: "Authorization",
    bundleId: .appBundleID(name: ".Authorization"),
    product: .staticFramework,
    settings: .settings(),
    dependencies: [
    
    
    ],
    sources: ["Sources/**"]
)
