//
//  Text+Builder.swift
//  JoinedText
//
//  Created by Łukasz Rutkowski on 28/08/2020.
//

import SwiftUI

extension Text {

    /// Creates a  combined text view based on the given `content` by inserting
    /// `separator` text views between each received text component.
    ///
    /// - Parameters:
    ///   - separator: The text to use as a separator between received text components.
    ///     The default separator is a space character.
    ///   - content: A text builder that creates text components.
    public init(separator: Text = Text(" "), @TextBuilder content: () -> [Text]) {
        self = content().joined(separator: separator)
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

    /// Creates a  combined text view based on the given `content` by inserting
    /// `separator` text views between each received text component.
    ///
    /// - Parameters:
    ///   - separator: The text to use as a separator between received text components.
    ///     The default separator is a space character.
    ///   - content: A text builder that creates text components.
    @available(swift, deprecated: 5.3)
    public init(separator: Text = Text(" "), @TextBuilder content: () -> Text) {
        self = content()
    }

    /// Creates a  combined text view based on the given `content` by inserting
    /// `separator` text between each received text component.
    ///
    /// - Parameters:
    ///   - separator: The text to use as a separator between received text components.
    ///   - content: A text builder that creates text components.
    @available(swift, deprecated: 5.3)
    public init(separator: LocalizedStringKey, @TextBuilder content: () -> Text) {
        self.init(separator: Text(separator), content: content)
    }
}
