import Foundation

public struct ItemBase: Identifiable, Hashable {
  public var id: String { name }
  public let name: String
  
  public init(name: String) {
    self.name = name
  }
}
