// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "UIToolz",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "UIToolz",
            targets: ["UIToolz"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/flowtoolz/SwiftUIToolzOLD.git",
            exact: "0.3.0"
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
