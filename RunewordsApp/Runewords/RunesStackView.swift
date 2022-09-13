import SwiftUI
import RunesData
import DesignSystem

struct RunesStackView: View {
  let runes: [String]
  
  @Binding var asImage: Bool
  
  var body: some View {
    HStack {
      ForEach(runes, id: \.self) { rune in
        if asImage {
          Image(rune.lowercased())
            .resizable()
            .frame(width: 30, height: 30)
        } else {
          Text(rune)
            .font(.AVQestFont(textStyle: .title2))
        }
      }
    }
  }
}
