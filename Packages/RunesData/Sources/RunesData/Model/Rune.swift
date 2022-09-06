import Foundation

public struct Rune: Decodable, Identifiable, Hashable {
  public var id: String { name }
  public let name: String
  public let tier: Int
  public let armor: String
  public let weapon: String
  public let shield: String
  public let countess: String
  public let hellforge: String
  public let treasure: String
  public let cube: String?
}
