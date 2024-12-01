//
//  Services.swift
//  Aliens Archive
//
//  Created by John Lane on 11/30/24.
//

import Foundation

enum ServiceType {
    case media(id: String)
    case species

    var path: String {
        switch self {
        case .media(let id):
            "media/\(id)"
        case .species:
            "species"
        }
    }
    
    var urlRequest: URLRequest {
        let url = URL(
            string: "https://alienarchive.flywheelsites.com/wp-json/wp/v2/\(path)"
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
