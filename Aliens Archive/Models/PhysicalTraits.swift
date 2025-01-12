//
//  Characteristics.swift
//  Aliens Archive
//
//  Created by John Lane on 1/11/25.
//

struct PhysicalTraits: Decodable {
    let bodyShape: String
    let size: String
    let skin: String
    let limbs: String
    let head: String
    let eyes: String
    let nose: String
    let mouth: String
    let ears: String
    let handsFeet: String

    func value(for key: CodingKeys) -> String {
        switch key {
        case .bodyShape:
            return bodyShape
        case .size:
            return size
        case .skin:
            return skin
        case .limbs:
            return limbs
        case .head:
            return head
        case .eyes:
            return eyes
        case .nose:
            return nose
        case .mouth:
            return mouth
        case .ears:
            return ears
        case .handsFeet:
            return handsFeet
        }
    }

    enum CodingKeys: String, CodingKey, Decodable, CaseIterable {
        case size
        case skin
        case limbs
        case head
        case eyes
        case nose
        case mouth
        case ears
        case bodyShape = "body_shape"
        case handsFeet = "hands_feet"

        var label: String {
            switch self {
            case .bodyShape:
                return "Body Shape"
            case .handsFeet:
                return "Hands and Feet"
            default:
                return rawValue.capitalized
            }
        }

    }
}

struct Capabilities: Decodable {
    let communication: String
    let movement: String
}
