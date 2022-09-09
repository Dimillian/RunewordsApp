import SwiftUI
import RunesData
import DesignSystem

struct CubeRecipesListView: View {
  @EnvironmentObject private var data: RunesData
  
  @State private var search: String = ""
  
  var recipes: [CubeRecipe] {
    if !search.isEmpty {
      return data.cubeRecipes.filter{ $0.description.contains(search) }
    }
    return data.cubeRecipes
  }
  
  var body: some View {
    List(recipes) { recipe in
      VStack(alignment: .leading) {
        Text(recipe.formattedInput)
        Text(recipe.formattedOutput)
          .foregroundColor(.itemsColor(color: .rare))
      }
      .font(.AVQestFont(textStyle: .callout))
    }
    .searchable(text: $search,
                placement: .navigationBarDrawer(displayMode: .automatic))
    .navigationTitle("Cube Recipes")
  }
}

struct CubeRecipesListView_Previews: PreviewProvider {
  static var previews: some View {
    CubeRecipesListView()
  }
}
