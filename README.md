# JoinedText

A SwiftUI view for combining multiple `Text` views into a single `Text` instance.

## Before

```swift
Text("This text")
    + Text(" is ").fontWeight(.bold)
    + Text("hard to ").font(.system(.body, design: .monospaced))
    + Text("read")
        .font(Font.title.smallCaps())
        .foregroundColor(.green)
        .underline()
```

## After

```swift
JoinedText {
    Text("This text can be")
    if isTrue {
        Text("bold,")
            .fontWeight(.bold)
        Text("monospaced")
            .font(.system(.body, design: .monospaced))
        Text("or")
    }
    Text("styled")
        .font(.system(.caption))
    Text("however")
        .italic()
    Text("you")
        .font(Font.title.smallCaps())
    Text("want and")
    Text("everything")
        .foregroundColor(.green)
        .underline()
    Text("will be combined 😃.")
}
```

## Result

![Preview](./Art/Preview.png)

# Options

TODO

# License

TODO