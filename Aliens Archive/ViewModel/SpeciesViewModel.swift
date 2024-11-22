//
//  SpeciesViewModel.swift
//  Aliens Archive
//
//  Created by John Lane on 11/17/24.
//

import Foundation

class SpeciesViewModel: ObservableObject {
    
    @Published var species: [Species]
    @Published var error: Bool = false

    init() {
        species = []
        error = false
    
        getAllSpecies(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let species):
                    self.species = species
                default:
                    self.error = true
                }
            }
        })
    }
    
    func getAllSpecies(completion: @escaping (Result<[Species], Error>) -> Void) {
        guard let url = URL(string: "https://alienarchive.flywheelsites.com/wp-json/wp/v2/species/") else {
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
