import Foundation

public struct Rune: Decodable, Identifiable, Hashable {
  public var id: String { name }
  public let name: String
  public let tier: Int
  
  init(name: String, tier: Int) {
    self.name = name
    self.tier = tier
  }
}
