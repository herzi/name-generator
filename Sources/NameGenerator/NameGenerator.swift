//
//  NameGenerator.swift
//  name-generator
//
//  Created by Sven Herzberg on 2023-11-25.
//

public struct NameGenerator {
    private func candidate () -> (adjective: Adjective, person: Person) {
        (Adjective.random(), Person.random())
    }
    
    public func generateName () -> String {
        var candidate = candidate()
        while candidate == ("boring", "wozniak") {
            candidate = self.candidate()
        }
        return [
            candidate.adjective.description,
            candidate.person.description,
        ].joined(separator: "_")
    }
}
