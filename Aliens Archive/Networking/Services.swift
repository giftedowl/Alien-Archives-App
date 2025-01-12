//
//  Services.swift
//  Aliens Archive
//
//  Created by John Lane on 11/30/24.
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
            request.addValue("Bearer YOUR_API_KEY", forHTTPHeaderField: "Authorization")
            print("Body \(body)")
            if let jsonBody = try? JSONEncoder().encode(body) {
                request.httpBody = jsonBody
            }
        default:
            break
        }
    }
}

struct Services {

    func fetchServiceArray<T: Decodable>(
        type: [T.Type],
        request: ServiceType
    ) async throws -> [T] {
        let data = try await run(request.urlRequest)
        return try JSONDecoder().decode([T].self, from: data)
    }

    func fetchService<T: Decodable>(
        type: T.Type,
        request: ServiceType
    ) async throws -> T {
        let data = try await run(request.urlRequest)
        return try JSONDecoder().decode(T.self, from: data)
    }

    func fetchData(
        request: ServiceType
    ) async throws -> Data {
        return try await run(request.urlRequest)
    }

    private func run(_ urlRequest: URLRequest) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(
            for: urlRequest
        )
        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return data
    }
}
