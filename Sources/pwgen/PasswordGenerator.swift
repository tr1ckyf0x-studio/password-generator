//
//  PasswordGenerator.swift
//
//
//  Created by Vladislav Lisianskii on 02.03.2024.
//

import Foundation

protocol GeneratesPassword {
    func generatePassword(symbolTypes: [SymbolType], length: UInt) -> String
}

struct PasswordGenerator {
    private let symbolRangeStringFactory: GeneratesSymbolRangeString

    init(
        symbolRangeStringFactory: GeneratesSymbolRangeString = SymbolType.RangeStringFactory()
    ) {
        self.symbolRangeStringFactory = symbolRangeStringFactory
    }
}

// MARK: - GeneratesPassword

extension PasswordGenerator: GeneratesPassword {
    func generatePassword(
        symbolTypes: [SymbolType],
        length: UInt
    ) -> String {
        let rangeString = symbolTypes
            .map(symbolRangeStringFactory.string(for:))
            .joined()
        
        return (0..<length)
            .lazy
            .compactMap { (_: UInt) -> Character? in
                rangeString.randomElement()
            }
            .map(String.init)
            .joined()
    }
}
