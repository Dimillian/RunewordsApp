import Foundation
import CoreGraphics
import CoreText
import UIKit

public struct DesignSystem {
  public static func registerFonts() {
    AppFont.allCases.forEach {
      registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
    }
  }
  
  public static func registerAppaerance() {
    UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.AVQestFont(size: 32)]
    UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.AVQestFont(size: 20)]
    UITabBarItem.appearance().setTitleTextAttributes([.font:  UIFont.AVQestFont(size: 14)], for: .normal)
  }
  
  fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
      guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
          let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
          let font = CGFont(fontDataProvider) else {
      fatalError("Couldn't create font from data")
    }
    
    var error: Unmanaged<CFError>?
    
    CTFontManagerRegisterGraphicsFont(font, &error)
  }
}
