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
        }
        let url = URL(
            string: urlString
        )!
        return URLRequest(url: url)
    }
}

struct Services {

    func fetchService<T: Decodable>(type: [T.Type], request: ServiceType, completion: @escaping (Result<[T], Error>) -> Void) async {
        URLSession.shared.dataTask (
            with: request.urlRequest) { data, response, error in
                if let error {
                    completion(.failure(error))
                }
                guard let data else {
                    completion(.failure( NSError(domain: "Bad data", code: -1)))
                    return
                }
                do {
                    let result = try JSONDecoder().decode([T].self, from: data)
                    completion(.success(result))
                } catch(let error) {
                    print("Error \(error)")
                }
        }.resume()
    }

    func fetchService<T: Decodable>(type: T.Type, request: ServiceType, completion: @escaping (Result<T, Error>) -> Void) async {
        URLSession.shared.dataTask (
            with: request.urlRequest) { data, response, error in
                if let error {
                    completion(.failure(error))
                }
                guard let data else {
                    completion(.failure( NSError(domain: "Bad data", code: -1)))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch(let error) {
                    print("Error \(error)")
                }
        }.resume()
    }
    
    func fetchData(type: ServiceType, completion: @escaping (Result<Data, Error>) -> Void) async {
        URLSession.shared.dataTask (
            with: type.urlRequest) { data, response, error in
                if let error {
                    completion(.failure(error))
                }
                guard let data else {
                    completion(.failure( NSError(domain: "Bad data", code: -1)))
                    return
                }
                completion(.success(data))
        }.resume()
    }
}
