import Foundation

public struct CubeRecipe: Identifiable, Hashable, Decodable {
  public var id: String { description }
  public let description: String
  public let enabled: Int?
  public let output: String
  
  public var formattedInput: String {
    String(description.split(separator: "->")[0])
  }
  
  public var formattedOutput: String {
    var output = String(description.split(separator: "->")[1])
    _ = output.removeFirst()
    return output
  }
}
