//
//  TextBuilder.swift
//  JoinedText
//
//  Created by Łukasz Rutkowski on 28/08/2020.
//

import SwiftUI

/// A custom parameter attribute that constructs text views from closures.
///
/// You typically use ``ViewBuilder`` as a parameter attribute for child
/// text-producing closure parameters, allowing those closures to provide
/// multiple text views. For example, the following `collectedText` function
/// accepts a closure that produces one or more text views via the view builder.
///
///     func collectedText(
///         @ViewBuilder textComponents: () -> [Text]
///     ) -> [Text]
///
/// Clients of this function can use multiple-statement closures to provide
/// several text views, as shown in the following example:
///
///     myView.collectedText {
///         Text("This")
///         Text("is")
///         Text("a")
///         if isReady {
///             Text("combined sentence")
///         }
///     }
///
@_functionBuilder
public struct TextBuilder {

    public static func buildBlock(_ texts: [Text]...) -> [Text] {
        texts.flatMap { $0 }
    }

    public static func buildExpression(_ text: Text?) -> [Text] {
        text.map { [$0] } ?? []
    }

    public static func buildIf(_ texts: [Text]?) -> [Text] {
        texts ?? []
    }

    public static func buildEither(first: [Text]) -> [Text] {
        first
    }

    public static func buildEither(second: [Text]) -> [Text] {
        second
    }

    public static func buildDo(_ texts: [Text]) -> [Text] {
        texts
    }

    static func join(_ texts: [Text], separator: Text) -> Text {
        texts.reduce(Text("")) { (joinedText, text) in
            joinedText + separator + text
        }
    }
}
