import SwiftUI
import RunesData
import DesignSystem

struct RunewordView: View {
  let runeword: Runeword
  
  var body: some View {
    List {
      Section {
        LabeledContent("Level", value: String(runeword.level))
        LabeledContent {
          RunesStackView(runes: Array(runeword.runes))
        } label: {
          Text("Runes")
        }
        LabeledContent("Base", value: runeword.types.joined(separator: ","))
      } header:  {
        Text("Information")
      }.font(.AVQestFont(textStyle: .body))
      
      Section {
        Text(runeword.description ?? "")
      } header: {
        Text("Description")
      }
      .font(.AVQestFont(textStyle: .body))
    }.navigationTitle(runeword.title)
  }
}

struct RunewordView_Previews: PreviewProvider {
  static var previews: some View {
    RunewordView(runeword: RunesData().runewords.first!)
  }
}
