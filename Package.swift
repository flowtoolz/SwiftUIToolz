// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "UIToolz",
    products: [
        .library(name: "UIToolz",
                 targets: ["UIToolz"]),
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
            .upToNextMajor(from: "6.0.0")
        ),
        .package(
            url: "https://github.com/flowtoolz/SwiftyToolz.git",
            .upToNextMajor(from: "1.5.5")
        ),
    ],
    targets: [
        .target(name: "UIToolz",
                dependencies: [
			"GetLaid",
			"FoundationToolz",
			"SwiftObserver",
			"SwiftyToolz",
		],
        path: "Code"),
    ]
)
