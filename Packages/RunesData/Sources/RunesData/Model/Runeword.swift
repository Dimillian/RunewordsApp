import Foundation

public struct Runeword: Codable, Identifiable, Hashable {
  public var id: String { title }
  public let title: String
  public let runes: [String]
  public let level: Int
  public let types: [String]
  public var description: String?
}
