//
//  Sequence+JoinedText.swift
//  JoinedText
//
//  Created by Łukasz Rutkowski on 29/08/2020.
//

import SwiftUI

extension Sequence where Element == Text {

    /// Returns a new `Text` by concatenating the elements of the sequence,
    ///
    /// The following example shows how an array of `Text` views can be joined to a
    /// single `Text` view with comma-separated string:
    ///
    ///     let cast = [Text("Vivien"), Text("Marlon"), Text("Kim")]
    ///     let list = cast.joined(separator: ", ")
    ///     // Gives Text("Vivien, Marlon, Kim, Karl")
    ///
    /// - Parameter separator: A `Text` view to insert between each of the elements
    ///   in this sequence. The default separator is a space character.
    /// - Returns: A single, concatenated `Text` view.
    public func joined(separator: Text = Text(" ")) -> Text {
        var isInitial = true
        return reduce(Text("")) { (joinedText, text) in
            if isInitial {
                isInitial = false
                return text
            }
            return joinedText + separator + text
        }
    }
}
