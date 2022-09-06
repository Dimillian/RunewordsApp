import XCTest
@testable import RunesData

final class RunesDataTests: XCTestCase {
  let data = RunesData()
  
  func testRunes() throws {
    XCTAssertEqual(data.runes.count, 33)
    XCTAssertEqual(data.runes.first?.name, "El")
  }
  
  func testRunesWords() throws {
    XCTAssertEqual(data.runewords.count, 85)
    XCTAssertEqual(data.runewords.first?.title, "Ancient's Pledge")
    XCTAssertEqual(data.runewords.first?.description?.utf8.count, 136)
  }
  
  func testRunewordsFilter() throws {
    XCTAssertEqual(data.runewordsFor(runes: ["Amn"]).count, 12)
    XCTAssertEqual(data.runewordsFor(runes: ["Ber", "Jah"]).count, 1)
  }
  
  func testItemBase() throws {
    XCTAssertEqual(data.itemBase.count, 19)
    XCTAssertEqual(data.itemBase.first!.name, "Axes")
  }
  
  func testItemBaseFilter() throws {
    XCTAssertEqual(data.runewordsFor(itemsBase: [.init(name: "Axes")]).count, 10)
    XCTAssertEqual(data.runewordsFor(itemsBase: [.init(name: "Axes")]).first!.title, "Steel")
  }
}
