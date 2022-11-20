// swift-tools-version:5.7

import PackageDescription

#if os(macOS)
let codePath = "Code/appkit"
#else
let codePath = "Code/uikit"
#endif

let package = Package(
    name: "UIToolz",
    platforms: [.iOS(.v12), .tvOS(.v12), .macOS(.v10_15)],
    products: [
        .library(
            name: "UIToolz",
            targets: ["UIToolz"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/flowtoolz/SwiftUIToolz.git",
            exact: "0.1.2"
        ),
        .package(
            url: "https://github.com/flowtoolz/GetLaid.git",
            exact: "4.0.0"
        ),
        .package(
            url: "https://github.com/codeface-io/SwiftObserver.git",
            exact: "7.0.4"
        ),
        .package(
            url: "https://github.com/flowtoolz/FoundationToolz.git",
            exact: "0.1.2"
        ),
        .package(
            url: "https://github.com/flowtoolz/SwiftyToolz.git",
            exact: "0.2.0"
        ),
    ],
    targets: [
        .target(
            name: "UIToolz",
            dependencies: [
                "SwiftUIToolz",
                "GetLaid",
                "FoundationToolz",
                "SwiftObserver",
                "SwiftyToolz",
            ],
            path: codePath
        ),
    ]
)
