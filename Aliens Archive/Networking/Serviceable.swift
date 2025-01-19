//
//  Serviceable.swift
//  Aliens Archive
//
//  Created by John Lane on 1/19/25.
//


protocol Serviceable {
    func fetchServiceArray<T: Decodable>(
        type: [T.Type],
        request: ServiceType
    ) async throws -> [T]

//    func fetchService<T: Decodable>(
//        type: T.Type,
//        request: ServiceType
//    ) async throws -> T
//
//    func fetchData(
//        request: ServiceType
//    ) async throws -> Data
}
