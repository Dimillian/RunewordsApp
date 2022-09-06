import SwiftUI
import RunesData
import DesignSystem

struct AppTabView: View {
  var body: some View {
    TabView {
      NavigationStack {
        RunewordsListView()
          .withRouteur()
      }
      .tabItem {
        Label("Runewords", systemImage: "leaf")
      }
      
      NavigationStack {
        RunesView()
          .withRouteur()
      }
      .tabItem {
        Label("Runes", systemImage: "triangle")
      }
      
      NavigationStack {
        StashView()
          .withRouteur()
      }
      .tabItem {
        Label("Stash", systemImage: "folder")
      }
    }
    .accentColor(.itemsColor(color: .runic))
  }
}

struct AppTabView_Previews: PreviewProvider {
  static var previews: some View {
    AppTabView()
  }
}
