import SwiftUI
import RunesData
import DesignSystem
import Stash

struct RuneDetailView: View {
  @EnvironmentObject private var data: RunesData
  @EnvironmentObject private var stash: Stash
  
  public let rune: Rune

  var body: some View {
    List {
      Section {
        LabeledContent {
          Image(rune.name.lowercased())
        } label: {
          Text("Rune")
        }
        LabeledContent("Weapon", value: rune.weapon)
        LabeledContent("Armor", value: rune.armor)
        LabeledContent("Shield", value: rune.shield)
      } header: {
        Text("Information")
      }
      .font(.AVQestFont(textStyle: .body))
      
      Section {
        LabeledContent("Countess extra drop?", value: rune.countess)
        LabeledContent("Hellforge drop?", value: rune.hellforge)
        LabeledContent("Treasure class", value: rune.treasure)
      } header: {
        Text("Drop")
      }
      .font(.AVQestFont(textStyle: .body))

      Section {
        ForEach(data.runewordsFor(runes: [rune.name])) { runeword in
          NavigationLink(value: runeword) {
            RunewordRowView(runeword: runeword)
          }
        }
      } header: {
        Text("Runewords")
      }
      .font(.AVQestFont(textStyle: .body))
    }
    .navigationTitle(rune.name)
    .toolbar {
      Button {
        stash.toggleRune(rune: rune)
      } label: {
        Image(systemName: stash.isInStash(rune: rune) ? "folder.fill" : "folder")
      }
    }
  }
}
