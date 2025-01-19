//
//  ToastViewModel.swift
//  Aliens Archive
//
//  Created by John Lane on 1/18/25.
//

import SwiftUI

protocol Toastable {
    var toast: ToastViewModel { get }
}

final class ToastViewModel: ObservableObject {

    @Published var show: Bool = false
    @Published var message: String = "Test"

    var timeInterval = 5.0

    public func show(message: String) {
        self.message = message
        show = true
        Timer
            .scheduledTimer(
                withTimeInterval: timeInterval,
                repeats: false
            ) { _ in
            self.show = false
        }
    }
}
