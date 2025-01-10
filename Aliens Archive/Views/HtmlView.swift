//
//  HtmlView.swift
//  Aliens Archive
//
//  Created by John Lane on 1/9/25.
//

import SwiftUI
import WebKit

struct HtmlView: UIViewRepresentable {
    let content: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(content, baseURL: nil)
    }
}
