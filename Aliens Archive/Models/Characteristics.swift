//
//  Characteristics.swift
//  Aliens Archive
//
//  Created by John Lane on 1/11/25.
//


struct Characteristics: Decodable {
    let communication: String
    let movement: String
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

    enum CodingKeys: String, CodingKey, Decodable, CaseIterable {
        case communication
        case movement
        case bodyShape = "body_shape"
        case size
        case skin
        case limbs
        case head
        case eyes
        case nose
        case mouth
        case ears
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

        func from(_ characteristics: Characteristics) -> String {
            switch self {
            case .communication:
                return characteristics.communication
            case .movement:
                return characteristics.movement
            case .bodyShape:
                return characteristics.bodyShape
            case .size:
                return characteristics.size
            case .skin:
                return characteristics.skin
            case .limbs:
                return characteristics.limbs
            case .head:
                return characteristics.head
            case .eyes:
                return characteristics.eyes
            case .nose:
                return characteristics.nose
            case .mouth:
                return characteristics.mouth
            case .ears:
                return characteristics.ears
            case .handsFeet:
                return characteristics.handsFeet
            }
        }
    }
}
