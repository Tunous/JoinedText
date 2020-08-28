//
//  TextBuilder.swift
//  JoinedText
//
//  Created by Łukasz Rutkowski on 28/08/2020.
//

import SwiftUI

/// A view that builds a single combined text view.
public struct JoinedText: View {
    public let body: Text

    /// Creates a  combined text view based on the given `content` by inserting
    /// `separator` text views between each received text component.
    ///
    /// - Parameters:
    ///   - separator: The text to use as a separator between received text components.
    ///   - content: A text builder that creates text components.
    public init(separator: Text, @TextBuilder content: () -> [Text]) {
        body = TextBuilder.join(content(), separator: separator)
    }
}

extension JoinedText {

    /// Creates a  combined text view based on the given `content` by inserting
    /// space character between each received text component.
    ///
    /// - Parameters:
    ///   - content: A text builder that creates text components.
    public init(@TextBuilder content: () -> [Text]) {
        self.init(separator: Text(" "), content: content)
    }

    /// Creates a  combined text view based on the given `content` by inserting
    /// `separator` text between each received text component.
    ///
    /// - Parameters:
    ///   - separator: The text to use as a separator between received text components.
    ///   - content: A text builder that creates text components.
    public init(separator: LocalizedStringKey, @TextBuilder content: () -> [Text]) {
        self.init(separator: Text(separator), content: content)
    }
}
