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
                return "your body is \(value)"
            case .skin:
                return "your skin is \(value)"
            case .limbs:
                return "your limbs are \(value)"
            case .head:
                return "your head is \(value)"
            case .eyes:
                return "your eyes are \(value)"
            case .nose:
                return "your nose is \(value)"
            case .mouth:
                return "your mouth is \(value)"
            case .ears:
                return "your ears are \(value)"
            case .hands:
                return "your hands are \(value)"
            case .feet:
                return "your feet are \(value)"
            }
        }
    }
}

