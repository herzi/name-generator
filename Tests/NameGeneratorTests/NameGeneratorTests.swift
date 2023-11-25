//
//  NameGenerator.swift
//  name-generator
//
//  Created by Sven Herzberg on 2023-11-25.
//

import XCTest

import NameGenerator

final class NameGeneratorTests: XCTestCase {
    func testNameFormat () {
        // Arrange:
        let sut = NameGenerator()
        let permitted = CharacterSet(charactersIn: "a" ... "z")
            .union(.init(charactersIn: "A" ... "Z"))
            .union(.init(charactersIn: "_"))
        
        for _ in 1 ... 100 {
            // Act:
            let name = sut.generateName()
            
            // Assert:
            XCTAssert(name.contains("_"), name)
            XCTAssert(name.allSatisfy { $0.unicodeScalars.allSatisfy(permitted.contains(_:)) })
        }
    }
}

extension String {
    func contains (_ character: Character) -> Bool {
        contains { $0 == character }
    }
}
