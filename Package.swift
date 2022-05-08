// swift-tools-version:5.4

import PackageDescription

#if os(macOS)
let codePath = "Code/appkit"
#else
let codePath = "Code/uikit"
#endif

let package = Package(
    name: "UIToolz",
    platforms: [.iOS(.v12), .tvOS(.v12), .macOS(.v10_14)],
    products: [
        .library(
            name: "UIToolz",
            targets: ["UIToolz"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/flowtoolz/GetLaid.git",
            .branch("master")
        ),
        .package(
            url: "https://github.com/flowtoolz/FoundationToolz.git",
            .branch("master")
        ),
        .package(
            url: "https://github.com/flowtoolz/SwiftObserver.git",
            .branch("master")
        ),
        .package(
            url: "https://github.com/flowtoolz/SwiftyToolz.git",
            .branch("master")
        ),
    ],
    targets: [
        .target(
            name: "UIToolz",
            dependencies: [
                "GetLaid",
                "FoundationToolz",
                "SwiftObserver",
                "SwiftyToolz",
            ],
            path: codePath
        ),
    ]
)
