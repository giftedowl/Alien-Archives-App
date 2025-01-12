//
//  Characteristics.swift
//  Aliens Archive
//
//  Created by John Lane on 1/11/25.
//

struct Physical: Decodable, Promptable {
    let body: String
    let height: String
    let skin: String
    let limbs: String
    let head: String
    let eyes: String
    let nose: String
    let mouth: String
    let ears: String
    let hands: String
    let feet: String

    var prompt: String {
        return Traits.reduceTraits(for: self)
    }

    enum Traits: Traitable {
        case body
        case skin
        case limbs
        case head
        case eyes
        case nose
        case mouth
        case ears
        case hands
        case feet

        static func reduceTraits(for item: Physical) -> String {
            return Traits.allCases.reduce("") { result, trait in
                let promptLabel = trait.promptLabel(for: item)
                guard !promptLabel.isEmpty else {
                    return result
                }
                return "\(result) \(promptLabel)."
            }
        }

        func value(of item: Physical) -> String {
            switch self {
            case .body:
                return item.body
            case .skin:
                return item.skin
            case .limbs:
                return item.limbs
            case .head:
                return item.head
            case .eyes:
                return item.eyes
            case .nose:
                return item.nose
            case .mouth:
                return item.mouth
            case .ears:
                return item.ears
            case .hands:
                return item.hands
            case .feet:
                return item.feet
            }
        }

        func promptLabel(for item: Physical) -> String {
            let value = value(of: item)
            guard !value.isEmpty else {
                return ""
            }
            switch self {
            case .body:
                return "Body is \(value)"
            case .skin:
                return "Skin is \(value)"
            case .limbs:
                return "Limbs are \(value)"
            case .head:
                return "Head is \(value)"
            case .eyes:
                return "Eyes are \(value)"
            case .nose:
                return "Nose is \(value)"
            case .mouth:
                return "Mouth is \(value)"
            case .ears:
                return "Ears are \(value)"
            case .hands:
                return "Hands are \(value)"
            case .feet:
                return "Feet are \(value)"
            }
        }
    }
}

