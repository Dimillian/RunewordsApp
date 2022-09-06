import SwiftUI
import RunesData
import DesignSystem

struct RuneDetailView: View {
  @EnvironmentObject private var data: RunesData
  
  public let rune: Rune

  var body: some View {
    List {
      Section {
        LabeledContent {
          Image(rune.name.lowercased())
        } label: {
          Text("Rune")
        }
        LabeledContent("Level", value: "TBD")
        LabeledContent("Effect", value: "TBD")
      } header: {
        Text("Information")
      }
      .font(.AVQestFont(textStyle: .body))

      Section {
        ForEach(data.runewordsFor(runes: [rune.name])) { runeword in
          RunewordRowView(runeword: runeword)
        }
      } header: {
        Text("Runewords")
      }
      .font(.AVQestFont(textStyle: .body))
      
    }.navigationTitle(rune.name)
  }
}
