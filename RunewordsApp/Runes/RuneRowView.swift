import SwiftUI
import RunesData

struct RuneRowView: View {
  let rune: Rune
  
  var body: some View {
    VStack {
      Image(rune.name.lowercased())
      Text(rune.name)
        .font(.AVQestFont(textStyle: .headline))
        .foregroundColor(.white)
    }
  }
}

struct RuneRowView_Previews: PreviewProvider {
  static var previews: some View {
    RuneRowView(rune: RunesData().runes.first!)
  }
}
