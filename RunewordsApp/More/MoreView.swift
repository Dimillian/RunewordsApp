import SwiftUI
import DesignSystem

struct MoreView: View {
  var body: some View {
    Form {
      Section {
        NavigationLink(destination: CubeRecipesListView()) {
          Text("Cube recipes")
        }
      }
      
      Section {
        LabeledContent {
          Text("Thomas Ricouard")
        } label: {
          Text("Author")
        }
        LabeledContent {
          Link("@Dimillian", destination: URL(string: "https://twitter.com/dimillian")!)
        } label: {
          Text("Twitter")
        }
        LabeledContent {
          Link("Dimillian", destination: URL(string: "https://github.com/Dimillian?tab=repositories")!)
        } label: {
          Text("GitHub")
        }
        LabeledContent {
          Link("github/RunewordsApp", destination: URL(string: "https://github.com/Dimillian/RunewordsApp")!)
        } label: {
          Text("Source code")
        }
        LabeledContent {
          Link("blizzhackers/d2data",
               destination: URL(string: "https://github.com/blizzhackers/d2data/tree/master/json")!)
        } label: {
          Text("Datasource")
        }
      } header: {
        Text("About")
      }
    }
    .font(.AVQestFont(textStyle: .body))
    .navigationTitle("More")
  }
}

struct MoreView_Previews: PreviewProvider {
  static var previews: some View {
    MoreView()
  }
}
