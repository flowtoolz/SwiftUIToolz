// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SwiftUIToolz",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "SwiftUIToolz",
            targets: ["SwiftUIToolz"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/flowtoolz/SwiftUIToolzOLD.git",
            exact: "0.3.8"
        ),
        .package(
            url: "https://github.com/flowtoolz/GetLaid.git",
            exact: "4.0.0"
        ),
        .package(
            url: "https://github.com/codeface-io/SwiftObserver.git",
            exact: "7.0.8"
        ),
        .package(
            url: "https://github.com/flowtoolz/FoundationToolz.git",
            exact: "0.3.0"
        ),
        .package(
            url: "https://github.com/flowtoolz/SwiftyToolz.git",
            exact: "0.5.0"
        ),
    ],
    targets: [
        .target(
            name: "SwiftUIToolz",
            dependencies: [
                "SwiftUIToolzOLD",
                "GetLaid",
                "FoundationToolz",
                "SwiftObserver",
                "SwiftyToolz",
            ],
            path: "Code"
        ),
    ]
)
