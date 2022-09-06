import SwiftUI
import RunesData
import DesignSystem

struct RunewordRowView: View {
  let runeword: Runeword
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      runewordName
      RunesStackView(runes: runeword.runes)
    }
  }
  
  private var runewordName: some View {
    Text(runeword.title)
      .font(.AVQestFont(textStyle: .title3))
  }
}

struct RunewordRowView_Previews: PreviewProvider {
  static var previews: some View {
    List {
      RunewordRowView(runeword: RunesData().runewords.first!)
      RunewordRowView(runeword: RunesData().runewords.first!)
      RunewordRowView(runeword: RunesData().runewords.first!)
      RunewordRowView(runeword: RunesData().runewords.first!)
      RunewordRowView(runeword: RunesData().runewords.first!)
      RunewordRowView(runeword: RunesData().runewords.first!)
    }
    .listStyle(.plain)
    .preferredColorScheme(.dark)
  }
}
