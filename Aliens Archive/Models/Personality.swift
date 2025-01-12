//
//  Personality.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//

struct Personality: Decodable, Promptable {
    let temperament: String
    let humor: String
    let intelligence: String
    let emotional: String

    var prompt: String {
        return Traits.reduceTraits(for: self)
    }

    enum Traits: Traitable {
        case temperament
        case humor
        case intelligence
        case emotional

        static func reduceTraits(for item: Personality) -> String {
            return Traits.allCases.reduce("") { result, trait in
                let promptLabel = trait.promptLabel(for: item)
                guard !promptLabel.isEmpty else {
                    return result
                }
                return "\(result) \(promptLabel)."
            }
        }

        func value(of item: Personality) -> String {
            switch self {
            case .temperament:
                return item.temperament
            case .humor:
                return item.humor
            case .intelligence:
                return item.intelligence
            case .emotional:
                return item.emotional
            }
        }

        func promptLabel(for item: Personality) -> String {
            let value = value(of: item)
            guard !value.isEmpty else {
                return ""
            }
            switch self {
            case .temperament:
                return "your temperament is \(value)"
            case .humor:
                return "your humor style is \(value)"
            case .intelligence:
                return "you are intellectually \(value)"
            case .emotional:
                return "you are emotionally \(value)"
            }
        }
    }
}
