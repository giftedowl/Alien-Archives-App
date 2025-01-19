//
//  MockService.swift
//  Aliens Archive
//
//  Created by John Lane on 1/19/25.
//

import Foundation
@testable import Aliens_Archive

class MockService: Serviceable {
    func fetchServiceArray<T>(
        type: [T.Type],
        request: ServiceType
    ) async throws -> [T] where T : Decodable {
        let bundle = Bundle(for: MockService.self)
        let url = bundle.url(forResource: "MockSpeciesData", withExtension: "json")!
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([T].self, from: data)
    }
}
