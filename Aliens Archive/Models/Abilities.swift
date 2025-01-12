//
//  Abilities.swift
//  Aliens Archive
//
//  Created by John Lane on 1/12/25.
//


struct Abilities: Decodable, Promptable {
    let supernatural: String
    let physical: String
    let technological: String
    let knowledge: String
    let hobbies: String

    var prompt: String {
        return Traits.reduceTraits(for: self)
    }

    enum Traits: Traitable {
        case supernatural
        case physical
        case technological
        case knowledge
        case hobbies

        static func reduceTraits(for item: Abilities) -> String {
            return Traits.allCases.reduce("") { result, trait in
                let promptLabel = trait.promptLabel(for: item)
                guard !promptLabel.isEmpty else {
                    return result
                }
                return "\(result) \(promptLabel)."
            }
        }

        func value(of item: Abilities) -> String {
            switch self {
            case .supernatural:
                return item.supernatural
            case .physical:
                return item.physical
            case .technological:
                return item.technological
            case .knowledge:
                return item.knowledge
            case .hobbies:
                return item.hobbies
            }
        }

        func promptLabel(for item: Abilities) -> String {
            let value = value(of: item)
            guard !value.isEmpty else {
                return ""
            }
            switch self {
            case .supernatural:
                return "your supernatural abilties is \(value)"
            case .physical:
                return "your physical abilties are \(value)"
            case .technological:
                return "you have technological abilites \(value)"
            case .knowledge:
                return "you are knowledgeable in \(value)"
            case .hobbies:
                return "your hobbies include \(value)"
            }
        }
    }
}
