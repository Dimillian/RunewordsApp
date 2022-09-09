import SwiftUI
import RunesData
import DesignSystem
import Stash

struct RunewordDetailView: View {
  @EnvironmentObject private var stash: Stash
  
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
          .foregroundColor(.itemsColor(color: .magic))
      } header: {
        Text("Description")
      }
      .font(.AVQestFont(textStyle: .body))
    }
    .navigationTitle(runeword.title)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          stash.toggleFavorite(runeword: runeword)
        } label: {
          Image(systemName: stash.isFavorite(runeword: runeword) ? "star.fill" : "star")
            .tint(.itemsColor(color: .runic))
        }

      }
    }
  }
}

struct RunewordView_Previews: PreviewProvider {
  static var previews: some View {
    RunewordDetailView(runeword: RunesData().runewords.first!)
  }
}
