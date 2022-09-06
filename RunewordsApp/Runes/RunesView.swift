import SwiftUI
import RunesData
import DesignSystem

struct RunesView: View {
  @EnvironmentObject private var data: RunesData
  
  let columns = [
    GridItem(.adaptive(minimum: 80))
  ]
  
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(data.runes) { rune in
          NavigationLink(value: rune) {
            VStack {
              Image(rune.name.lowercased())
              Text(rune.name)
                .font(.AVQestFont(textStyle: .headline))
                .foregroundColor(.white)
            }
          }
        }
      }
    }.navigationTitle("Runes")
  }
}

struct RunesView_Previews: PreviewProvider {
  static var previews: some View {
    RunesView()
  }
}
