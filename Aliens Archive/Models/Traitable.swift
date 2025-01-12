//
//  Traitable.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//


protocol Traitable: CaseIterable {
    associatedtype ObjectType
    func value(of item: ObjectType) -> String
    func promptLabel(for item: ObjectType) -> String
    static func reduceTraits(for item: ObjectType) -> String
}
