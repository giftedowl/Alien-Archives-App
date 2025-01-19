//
//  ToastView.swift
//  Aliens Archive
//
//  Created by John Lane on 1/18/25.
//

import SwiftUI

struct ToastView: View, Toastable {

    @StateObject
    var toast: ToastViewModel

    var body: some View {
        if toast.show {
            ZStack {
                Theme.highlight.color
                    .opacity(0.8)
                Text(toast.message)
                    .foregroundStyle(Theme.background.color)
                    .font(.callout)
            }
            .frame(height: 50)
        }
    }
}
