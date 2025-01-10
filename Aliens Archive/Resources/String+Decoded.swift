//
//  String+Decoded.swift
//  Aliens Archive
//
//  Created by John Lane on 1/9/25.
//

import WebKit

extension String {
    var htmlDecoded: String {
        var decodedString = self
        if let data = self.data(using: .utf8) {
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            do {
                let attributedString = try NSAttributedString(data: data, options: options, documentAttributes: nil)
                decodedString = attributedString.string
            } catch {}
        }
        return decodedString
    }
}
