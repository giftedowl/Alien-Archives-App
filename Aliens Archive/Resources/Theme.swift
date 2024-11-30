//
//  Theme.swift
//  Aliens Archive
//
//  Created by John Lane on 11/30/24.
//

import Foundation
import SwiftUI

enum Theme {
    case background
    case highlight
    case primary
    case secondary
    case text

    var color: Color {
        switch self {
        case .background:
            Color("BackgroundColor")
        case .highlight:
            Color("HighlightColor")
        case .primary:
            Color("PrimaryColor")
        case .secondary:
            Color("SecondaryColor")
        case .text:
            Color("TextColor")
        }
    }
}
