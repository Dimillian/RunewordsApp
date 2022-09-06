import SwiftUI
import RunesData
import DesignSystem
import Stash

@main
struct RunewordsApp: App {
  init() {
    DesignSystem.registerFonts()
    DesignSystem.registerAppaerance()
  }
  
  var body: some Scene {
    WindowGroup {
      AppTabView()
        .environmentObject(RunesData())
        .environmentObject(Stash())
        .preferredColorScheme(.dark)
    }
  }
}
