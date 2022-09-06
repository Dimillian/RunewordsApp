import SwiftUI

extension Color {
  public enum ItemsPalette: String, CaseIterable {
    case magic, rare, unic, set, runic
  }
  
  public static func itemsColor(color: ItemsPalette) -> Color {
    .init(color.rawValue, bundle: .module)
  }
}
