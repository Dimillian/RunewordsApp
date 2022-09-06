// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Stash",
  platforms: [
    .iOS(.v16)
  ],
  products: [
    .library(
      name: "Stash",
      targets: ["Stash"]),
  ],
  dependencies: [
    .package(name: "RunesData", path: "./RunesData"),
  ],
  targets: [
    .target(
      name: "Stash",
      dependencies: ["RunesData"]),
    .testTarget(
      name: "StashTests",
      dependencies: ["Stash"]),
  ]
)
