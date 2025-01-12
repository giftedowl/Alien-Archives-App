//
//  Cultural.swift
//  Aliens Archive
//
//  Created by John Lane on 1/11/25.
//

struct Cultural: Decodable, Promptable {
    let planet: String
    let environment: String
    let language: String
    let society: String
    let religion: String

    var prompt: String {
        return Traits.reduceTraits(for: self)
    }

    enum Traits: String, Traitable {
        case planet
        case environment
        case language
        case society
        case religion

        static func reduceTraits(for item: Cultural) -> String {
            return Traits.allCases.reduce("") { result, trait in
                let promptLabel = trait.promptLabel(for: item)
                guard !promptLabel.isEmpty else {
                    return result
                }
                return "\(result) \(promptLabel)."
            }
        }

        func value(of item: Cultural) -> String {
            switch self {
            case .planet:
                return item.planet
            case .environment:
                return item.environment
            case .language:
                return item.language
            case .society:
                return item.society
            case .religion:
                return item.religion
            }
        }

        func promptLabel(for item: Cultural) -> String {
            let value = value(of: item)
            guard !value.isEmpty else {
                return ""
            }
            switch self {
            case .planet:
                return "you are from the planet \(value)"
            case .environment:
                return "your home planet environment is \(value)"
            case .language:
                return "your language is \(value)"
            case .society:
                return "your society is based on \(value)"
            case .religion:
                return "you have religion or spirual beliefs around \(value)"
            }
        }
    }
}
