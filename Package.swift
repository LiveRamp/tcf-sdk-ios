// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
        name: "LRPrivacyManagerSDK",
        platforms: [.iOS(.v10)],
        products: [
            .library(
                    name: "LRPrivacyManagerSDK",
                    targets: ["LRPrivacyManager"]
            ),
        ],
        dependencies: [
            .package(url: "https://github.com/liveramp/pl-sdk-ios", from: "1.0.7")
        ],
        targets: [
            .binaryTarget(
                name: "LRPrivacyManagerSDK", url: "https://gdpr-sdk-ios-prod.launch.liveramp.com/1.1.12/LRPrivacyManagerSDK.zip", checksum: "1afe93d4cee84223de5013e968ee27f0d981944bacecb9dac8dac53d88dad180"
            ),
            .target(
                name: "LRPrivacyManager",
                dependencies: [
                    .target(name: "LRPrivacyManagerSDK"),
                    .product(name: "LRPreferenceLinkSDK", package: "pl-sdk-ios")
                ],
                path: "Sources"
            )
        ]
)
