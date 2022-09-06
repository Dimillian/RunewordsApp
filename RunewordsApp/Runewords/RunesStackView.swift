import SwiftUI
import RunesData

struct RunesStackView: View {
  let runes: [String]
  
  var body: some View {
    HStack {
      ForEach(runes, id: \.self) { rune in
        Image(rune.lowercased())
          .resizable()
          .frame(width: 30, height: 30)
      }
    }
  }
}
