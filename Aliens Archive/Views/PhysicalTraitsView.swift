//
//  CharacteristicView.swift
//  Aliens Archive
//
//  Created by John Lane on 1/11/25.
//

import SwiftUI

struct PhysicalTraitsView: View {
    let traits: PhysicalTraits
    let attribute: PhysicalTraits.CodingKeys

    private var value: String {
        traits.value(
            for: attribute
        )
    }

    var body: some View {
        HStack {
            Text("\(attribute.label):")
                .bold()
            Text(value)
                .italic()
        }
        .padding(20)
        .background(Theme.highlight.color.opacity(0.8))
        .foregroundStyle(Theme.text.color)
        .cornerRadius(10)
    }
}
