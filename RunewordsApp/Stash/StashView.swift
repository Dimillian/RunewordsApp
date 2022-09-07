import SwiftUI
import DesignSystem
import Stash
import RunesData

struct StashView: View {
  @EnvironmentObject private var data: RunesData
  @EnvironmentObject private var stash: Stash
  
  var availableRunewords: [Runeword] {
    data.allAvailableRuneworsFor(runes: stash.runes.map{ $0.id })
  }
  
  var body: some View {
    List {
      runesSection
      availableRunewordsSection
      favoriteRunewordsSection
    }
    .listStyle(.insetGrouped)
    .navigationTitle("Stash")
  }
  
  private var runesSection: some View {
    Section("Runes") {
      if stash.runes.isEmpty {
        Text("Add runes to your stash from the Runes tab.")
          .font(.AVQestFont(textStyle: .title3))
      } else {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
          ForEach(stash.runes) { rune in
            RuneRowView(rune: rune)
          }
        }
      }
    }
    .font(.AVQestFont(textStyle: .headline))
  }
  
  private var availableRunewordsSection: some View {
    Section("Available Runewords") {
      if availableRunewords.isEmpty {
        Text("All possible runewords from your stahed runes will be displayed here.")
          .font(.AVQestFont(textStyle: .title3))
      } else {
        ForEach(availableRunewords) { runeword in
          NavigationLink(value: runeword) {
            RunewordRowView(runeword: runeword)
          }
        }
      }
    }
    .font(.AVQestFont(textStyle: .headline))
  }
  
  private var favoriteRunewordsSection: some View {
    Section("Favorite Runewords") {
      if stash.favoriteRunewords.isEmpty {
        Text("Add runewords to your favorite from the Runewords tab.")
          .font(.AVQestFont(textStyle: .title3))
      } else {
        ForEach(stash.favoriteRunewords) { runeword in
          NavigationLink(value: runeword) {
            RunewordRowView(runeword: runeword)
          }
        }
      }
    }
    .font(.AVQestFont(textStyle: .headline))
  }
}

struct StashView_Previews: PreviewProvider {
  static var previews: some View {
    StashView()
  }
}
