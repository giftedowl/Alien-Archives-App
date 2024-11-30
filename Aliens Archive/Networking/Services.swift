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
}

struct Services {
    private let baseUrl = "https://alienarchive.flywheelsites.com/wp-json/wp/v2/"
    
    func fetchBy(type: ServiceType, completion: @escaping (Result<[Species], Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)\(type.path)") else {
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask (
            with: urlRequest) { data , response, error in
                if let error {
                    completion(.failure(error))
                }
                guard let data else {
                    completion(.failure( NSError(domain: "Bad data", code: -1)))
                    return
                }
                let jsonDecoder = JSONDecoder()
                do {
                    let result = try jsonDecoder.decode([Species].self, from: data)
                    completion(.success(result))
                } catch(let error) {
                    print("Error \(error)")
                }
            }
        task.resume()
    }
}
