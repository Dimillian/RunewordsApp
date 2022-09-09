// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RunesData",
  platforms: [
    .iOS(.v16)
  ],
  products: [
    .library(
      name: "RunesData",
      targets: ["RunesData"]),
  ],
  targets: [
    .target(
      name: "RunesData",
      dependencies: [],
      resources: [
        .process("JSON/runes.json"),
        .process("JSON/runewords.json"),
        .process("JSON/runewords-description.json"),
        .process("JSON/cube-recipes.json"),
      ]),
    .testTarget(
      name: "RunesDataTests",
      dependencies: ["RunesData"]),
  ]
)
