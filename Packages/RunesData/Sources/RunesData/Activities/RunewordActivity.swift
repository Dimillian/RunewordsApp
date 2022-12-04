import ActivityKit

@available(iOS 16.1, *)
public struct RunewordActivityAttributes: ActivityAttributes {
  public struct ContentState: Codable, Hashable {
    public var runeword: Runeword
    
    public init(runeword: Runeword) {
      self.runeword = runeword
    }
  }
  
  public init() { }
}

@available(iOS 16.1, *)
public class RunewordActivityManager {
  public static let shared = RunewordActivityManager()
  
  public var currentActivity: Activity<RunewordActivityAttributes>?
}
