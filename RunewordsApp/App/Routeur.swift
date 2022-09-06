import Foundation
import SwiftUI
import RunesData

extension View {
  func withRouteur() -> some View {
    self.navigationDestination(for: Rune.self) { rune in
      RuneDetailView(rune: rune)
    }.navigationDestination(for: Runeword.self) { runeword in
      RunewordView(runeword: runeword)
    }
  }
}
