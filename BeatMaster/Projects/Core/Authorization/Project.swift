import ProjectDescription
import MyPlugin

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")


let project = Project.makeAppModule(
    name: "Authorization",
    bundleId: .appBundleID(name: ".Authorization"),
    product: .staticFramework,
    settings: .settings(),
    dependencies: [
    
    
    ],
    sources: ["Sources/**"]
)
