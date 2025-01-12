//
//  Personality.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//

struct Personality: Decodable, Promptable {
//    let temperament: String
    let humor: String
    let intelligence: String

    var prompt: String {
        return Traits.reduceTraits(for: self)
    }

    enum Traits: Traitable {
        case humor
        case intelligence

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
            case .humor:
                return item.humor
            case .intelligence:
                return item.intelligence
            }
        }

        func promptLabel(for item: Personality) -> String {
            let value = value(of: item)
            guard !value.isEmpty else {
                return ""
            }
            switch self {
            case .humor:
                return "humor style is \(value)"
            case .intelligence:
                return "intelligence level is \(value)"
            }
        }
    }
}
