import SwiftUI
import RunesData
import DesignSystem
import Stash

struct RunewordRowView: View {
  @EnvironmentObject private var stash: Stash
  
  enum DisplayMode {
    case compact, large
  }
  
  let runeword: Runeword
  let displayMode: DisplayMode
  
  init(runeword: Runeword, displayMode: DisplayMode = .compact) {
    self.runeword = runeword
    self.displayMode = displayMode
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      runewordName
      RunesStackView(runes: Array(runeword.runes), asImage: .constant(true))
      if displayMode == .large {
        largeModeView
          .font(.AVQestFont(textStyle: .body))
      }
    }
    .contextMenu {
      Button {
        stash.toggleFavorite(runeword: runeword)
      } label: {
        if stash.isFavorite(runeword: runeword) {
          Text("Remove form favorite")
        } else {
          Text("Add to favorite")
        }
      }
    }
  }
  
  private var runewordName: some View {
    Text("\(runeword.title) (l:\(runeword.level))")
      .font(.AVQestFont(textStyle: .title3))
  }
  
  @ViewBuilder
  private var largeModeView: some View {
    Text("Level: \(runeword.level)")
    Text("Base: \(runeword.types.joined(separator: ","))")
    Text(runeword.description ?? "")
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
