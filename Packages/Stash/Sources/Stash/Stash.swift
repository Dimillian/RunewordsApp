import SwiftUI
import RunesData

public class Stash: ObservableObject {
  struct StashData: Codable {
    let runewords: [Runeword]
    let runes: [Rune]
  }
  
  @Published public var favoriteRunewords: [Runeword] = [] {
    didSet {
      saveData()
    }
  }
  
  @Published public var runes: [Rune] = [] {
    didSet {
      saveData()
    }
  }

  private let encoder = JSONEncoder()
  private let decoder = JSONDecoder()
  
  private var dataURL: URL {
    try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
      .appending(path: "stashData")
  }
  
  public init() {
    let data = loadData()
    self.favoriteRunewords = data.runewords
    self.runes = data.runes
  }
  
  public func isFavorite(runeword: Runeword) -> Bool {
    favoriteRunewords.contains(where: { $0.id == runeword.id })
  }
  
  public func toggleFavorite(runeword: Runeword) {
    if isFavorite(runeword: runeword) {
      favoriteRunewords.removeAll(where: { $0.id == runeword.id })
    } else {
      favoriteRunewords.append(runeword)
    }
  }
  
  public func isInStash(rune: Rune) -> Bool {
    runes.contains(where: { $0.id == rune.id })
  }
  
  public func toggleRune(rune: Rune) {
    if isInStash(rune: rune) {
      runes.removeAll(where: { $0.id == rune.id })
    } else {
      runes.append(rune)
    }
  }
    
  private func saveData() {
    DispatchQueue.global().sync {
      let stashData = StashData(runewords: favoriteRunewords, runes: runes)
      do {
        let data = try encoder.encode(stashData)
        try data.write(to: dataURL, options: .atomic)
      } catch {
        print(error)
      }
    }
  }
  
  private func loadData() -> StashData {
    do {
      let data = try Data(contentsOf: dataURL)
      return try decoder.decode(StashData.self, from: data)
    } catch {
      return .init(runewords: [], runes: [])
    }
  }
  
  func clearData() {
    try? FileManager.default.removeItem(at: dataURL)
    runes = []
    favoriteRunewords = []
  }
}
