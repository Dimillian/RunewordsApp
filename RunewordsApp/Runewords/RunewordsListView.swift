import SwiftUI
import RunesData

struct RunewordsListView: View {
  @EnvironmentObject private var data: RunesData
  
  @State private var itemBaseFilter: [ItemBase] = []
  @State private var searchText: String = ""
  
  private var runewords: [Runeword] {
    var baseRunewords: [Runeword]
    if !itemBaseFilter.isEmpty {
      baseRunewords = data.runewordsFor(itemsBase: itemBaseFilter)
    } else {
      baseRunewords = data.runewords
    }
    if !searchText.isEmpty {
      baseRunewords = baseRunewords.filter{ $0.title.hasPrefix(searchText) }
    }
    return baseRunewords
  }
  
  var body: some View {
    List(runewords) { runeword in
      NavigationLink(value: runeword) {
        RunewordRowView(runeword: runeword)
      }
    }
    .listStyle(.plain)
    .navigationTitle("Runewords")
    .searchable(text: $searchText,
                tokens: $itemBaseFilter,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search & Filter Runewords",
                token: { token in
      Text(token.name)
    })
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        filterMenuView
      }
    }
  }
  
  private var filterMenuView: some View {
    Menu {
      ForEach(data.itemBase) { itemBase in
        Button {
          if !itemBaseFilter.contains(where: { $0.name == itemBase.name }) {
            itemBaseFilter.append(itemBase)
          }
        } label: {
          Text(itemBase.name)
        }
      }
    } label: {
      if !itemBaseFilter.isEmpty {
        Image(systemName: "line.3.horizontal.decrease.circle.fill")
      } else {
        Image(systemName: "line.3.horizontal.decrease.circle")
      }
    }
  }
}

struct RunewordsListView_Previews: PreviewProvider {
  static var previews: some View {
    RunewordsListView()
  }
}
