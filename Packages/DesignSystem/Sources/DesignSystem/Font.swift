import Foundation
import SwiftUI

public enum AppFont: String, CaseIterable {
  case AvQest
}

extension Font {
  public static func AVQestFont(textStyle: UIFont.TextStyle) -> Font {
    Font(UIFont.AVQestFont(size: UIFont.preferredFont(forTextStyle: textStyle).pointSize))
  }
}

extension UIFont {
  public static func AVQestFont(size: CGFloat) -> UIFont {
    UIFont(name: AppFont.AvQest.rawValue, size: size)!
  }
}
