//
//  ServiceType.swift
//  Aliens Archive
//
//  Created by John Lane on 1/19/25.
//

import Foundation

enum ServiceType {
    case data(media: SpeciesMedia)
    case media(id: String)
    case species
    case message(request: ChatGPTRequest)

    var urlRequest: URLRequest {
        let baseUrl = "https://alienarchive.flywheelsites.com/wp-json/wp/v2/"
        var urlString = ""
        switch self {
        case .media(let id):
            urlString = "\(baseUrl)media/\(id)"
        case .species:
            urlString = "\(baseUrl)species"
        case .data(let media):
            urlString = media.media_details.sizes.medium.source_url
        case .message(_):
            urlString = "https://api.openai.com/v1/chat/completions"
        }
        let url = URL(
            string: urlString
        )!
        var urlRequest = URLRequest(url: url)
        addHeaders(request: &urlRequest)
        return urlRequest
    }

    private func addHeaders(request: inout URLRequest) {
        switch self {
        case .message(let body):
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request
                .addValue(
                    "Bearer \(ApiKeys.openAIKey.rawValue)",
                    forHTTPHeaderField: "Authorization"
                )
            if let jsonBody = try? JSONEncoder().encode(body) {
                request.httpBody = jsonBody
            }
        default:
            break
        }
    }
}
