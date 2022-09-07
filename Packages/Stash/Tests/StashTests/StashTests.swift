import XCTest
@testable import Stash
import RunesData

final class StashTests: XCTestCase {
  override class func tearDown() {
    let stash = Stash()
    stash.clearData()
  }
  
  func testSaveRestoreClearData() {
    var stash = Stash()
    let data = RunesData()
    XCTAssertEqual(stash.runes.isEmpty, true)
    XCTAssertEqual(stash.favoriteRunewords.isEmpty, true)
    stash.favoriteRunewords.append(data.runewords.first!)
    stash.runes.append(data.runes.first!)
    stash = Stash()
    XCTAssertEqual(stash.runes.isEmpty, false)
    XCTAssertEqual(stash.favoriteRunewords.isEmpty, false)
    XCTAssertEqual(stash.runes.first, data.runes.first!)
    XCTAssertEqual(stash.favoriteRunewords.first, data.runewords.first!)
    stash.clearData()
    XCTAssertEqual(stash.runes.isEmpty, true)
    XCTAssertEqual(stash.favoriteRunewords.isEmpty, true)
    stash = Stash()
    XCTAssertEqual(stash.runes.isEmpty, true)
    XCTAssertEqual(stash.favoriteRunewords.isEmpty, true)
  }
  
  func testFavorite() {
    let stash = Stash()
    let data = RunesData()
    let runeword = data.runewords.first!
    XCTAssertEqual(stash.favoriteRunewords.isEmpty, true)
    stash.toggleFavorite(runeword: runeword)
    XCTAssertEqual(stash.isFavorite(runeword: runeword), true)
    stash.toggleFavorite(runeword: runeword)
    XCTAssertEqual(stash.isFavorite(runeword: runeword), false)
  }
  
  func testRunes() {
    let stash = Stash()
    let data = RunesData()
    let rune = data.runes.first!
    XCTAssertEqual(stash.runes.isEmpty, true)
    stash.toggleRune(rune: rune)
    XCTAssertEqual(stash.isInStash(rune: rune), true)
    stash.toggleRune(rune: rune)
    XCTAssertEqual(stash.isInStash(rune: rune), false)
  }
}
