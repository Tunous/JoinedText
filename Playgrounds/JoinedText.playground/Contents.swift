/*:
 # JoinedText

 ## Overview

 Similarly to how you can build regular view hierarchies, this library provides you with an additional initializer for `Text` view, that you can use to build complex sentences with varying styles. Inside of text definition block, you can use common code instructions such as `if`, `if else`, `switch` and similar statements to build complex multi style sentences.

 ### Basics

 To use this library first import the `JoinedText` module in addition to `SwiftUI`.
 */

import SwiftUI
import JoinedText

/*:
 This will give you access to `Text(_ content:)` initializer where you can build your sentence from multiple `Text` views provided in passed closure.
 */

let sample1 = Text {
    Text("Example")
    Text("sentence").bold()
}

/*:
 ### String separator

 By default all `Text`s declared inside of content block will be separated by a space character. You can change this behavior by providing your own separator text.
 */

let sample2 = Text(separator: "-") {
    Text("joined")
    Text("with")
    Text("dashes")
}

/*:
 ### Advanced separator

 For even more control, like additional styling, pass in `Text` instance as a separator.
 */

let sample3 = Text(separator: Text(" ! ").bold()) {
    Text("bold")
    Text("exclamation").underline()
    Text("mark")
}

/*:
 ### Control flow
 Inside of text definition blocks you can use control flow statements such as `if`, `switch` or `if let` to build your combined `Text`.
 */

let yourName = "Łukasz"

let sample4 = Text {
    Text("Hello,")
    if let name = yourName {
        Text(name).bold().foregroundColor(.green)
    } else {
        Text("what is your name?")
    }
}

/*:
 Run the playground and look at the canvas to see how the described code renders.
 */

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            sample1
            sample2
            sample3
            sample4
        }
        .frame(width: 240)
        .padding()
    }
}

import PlaygroundSupport
PlaygroundPage.current.setLiveView(ContentView())
