import SwiftUI
import RunesData
import DesignSystem
import Stash
import ActivityKit

struct RunewordDetailView: View {
  @EnvironmentObject private var stash: Stash
  
  @State private var runesAsImage = true
  
  let runeword: Runeword
  
  init(runeword: Runeword) {
    self.runeword = runeword
    
    if #available(iOS 16.1, *) {
      Task {
        RunewordActivityManager.shared.currentActivity = try? Activity<RunewordActivityAttributes>.request(attributes: .init(), contentState: .init(runeword: runeword))
      }
    }
  }
  
  var body: some View {
    List {
      Section {
        LabeledContent("Level", value: String(runeword.level))
        LabeledContent {
          RunesStackView(runes: Array(runeword.runes), asImage: $runesAsImage)
            .onTapGesture {
              runesAsImage.toggle()
            }
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
    .onDisappear {
      if #available(iOS 16.1, *) {
        Task {
          await RunewordActivityManager.shared.currentActivity?.end()
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
