import WidgetKit
import SwiftUI
import RunesData


@main
struct RunewordsWidget: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: RunewordActivityAttributes.self) { context in
      Text("Hello world")
    } dynamicIsland: { context in
      DynamicIsland {
        DynamicIslandExpandedRegion(.center) {
          HStack {
            ForEach(context.state.runeword.runes, id: \.self) { rune in
              Image(rune.lowercased())
                .resizable()
                .frame(width: 25, height: 25)
            }
          }
        }
        DynamicIslandExpandedRegion(.bottom) {
          Text(context.state.runeword.title).font(.footnote)
        }
        DynamicIslandExpandedRegion(.leading) {
          Image("cube")
            .resizable()
            .frame(width: 25, height: 34)
        }
        DynamicIslandExpandedRegion(.trailing) {
          Text("Level: \(context.state.runeword.level)")
        }
      } compactLeading: {
        Image("cube")
          .resizable()
      } compactTrailing: {
        Image(context.state.runeword.runes.first?.lowercased() ?? "")
      } minimal: {
        Image("cube")
          .resizable()
      }
    }
  }
}
