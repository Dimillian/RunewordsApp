import Foundation
import SwiftUI

public class RunesData: ObservableObject {
  public var runes: [Rune] = []
  public var runewords: [Runeword] = []
  public var itemBase: [ItemBase] = []
  
  enum BundleError: Error {
    case fileNotFound
  }
  
  public init() {
    let decoder = JSONDecoder()
    
    self.runes = loadRunes(decoder: decoder)
    self.runewords = loadRunewords(decoder: decoder)
    self.itemBase = Array(Set(runewords.flatMap{ $0.types })).sorted().map{ .init(name: $0) }
  }
  
  public func runewordsFor(runes: [String]) -> [Runeword] {
    if runes.isEmpty {
      return []
    }
    return runewords.filter({ $0.runes.isSuperset(of: runes) })
  }
  
  public func allAvailableRuneworsFor(runes: [String]) -> [Runeword] {
    if runes.isEmpty {
      return []
    }
    return runewords.filter({ $0.runes.isSubset(of: runes) })
  }
  
  public func runewordsFor(itemsBase: [ItemBase]) -> [Runeword] {
    runewords.filter({ $0.types.contains(itemsBase.map{ $0.name }) })
  }
  
  private func loadRunes(decoder: JSONDecoder) -> [Rune] {
    do {
      return try decoder.decode([Rune].self, from: try getJSONData(filename: "runes"))
    } catch {
      return []
    }
  }
  
  private func loadRunewords(decoder: JSONDecoder) -> [Runeword] {
    do {
      let runewords = try decoder.decode([Runeword].self, from: try getJSONData(filename: "runewords"))
      let description = try decoder.decode([String: String].self, from: try getJSONData(filename: "runewords-description"))
      var finaleRunewords: [Runeword] = []
      for var runeword in runewords {
        runeword.description = description[runeword.title]
        finaleRunewords.append(runeword)
      }
      return finaleRunewords
    } catch {
      return []
    }
  }
  
  private func getJSONData(filename: String) throws -> Data {
    guard let path = Bundle.module.path(forResource: filename, ofType: "json") else {
      throw BundleError.fileNotFound
    }
    return try Data(contentsOf: URL(filePath: path))
  }
}
