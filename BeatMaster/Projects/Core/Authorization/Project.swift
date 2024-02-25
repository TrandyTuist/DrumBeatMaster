import ProjectDescription
import ProjectTemplatePlugin
import DependencyPlugin

let project = Project.makeAppModule(
    name: "Authorization",
    bundleId: .appBundleID(name: ".Authorization"),
    product: .staticFramework,
    settings: .appBaseSetting(appName: "Authorization"),
    dependencies: [
    
    
    ],
    sources: ["Sources/**"]
)
