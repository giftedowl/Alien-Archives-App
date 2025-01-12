//
//  PromptView.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//

import SwiftUI

struct PromptView: View {
    let species: Species

    var body: some View {
        Text(species.prompt)
    }
}
