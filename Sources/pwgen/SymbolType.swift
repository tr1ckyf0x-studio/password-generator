//
//  SymbolType.swift
//
//
//  Created by Vladislav Lisianskii on 02.03.2024.
//

import ArgumentParser
import Foundation

enum SymbolType: String, CaseIterable {
    case lowerCaseLetters
    case upperCaseLetters
    case numbers
    case specialSymbols
}

extension SymbolType: ExpressibleByArgument {
    init?(argument: String) {
        let value = Self.allCases
            .lazy
            .first { (symbolType: SymbolType) -> Bool in
                symbolType.rawValue == argument
            }

        if let value {
            self = value
        } else {
            return nil
        }
    }
}

protocol GeneratesSymbolRangeString {
    func string(for symbolType: SymbolType) -> String
}

extension SymbolType {
    struct RangeStringFactory: GeneratesSymbolRangeString {
        func string(for symbolType: SymbolType) -> String {
            let range: ClosedRange<UInt32>
            switch symbolType {
            case .lowerCaseLetters:
                range = UInt32("a")...UInt32("z")

            case .upperCaseLetters:
                return string(for: .lowerCaseLetters).uppercased()

            case .numbers:
                range = UInt32("0")...UInt32("9")

            case .specialSymbols:
                return "!\";#$%&'()*+,-./:;<=>?@[]^_`{|}~"
            }

            return range
                .lazy
                .compactMap(UnicodeScalar.init)
                .map(Character.init)
                .map(String.init)
                .joined()
        }
    }
}
