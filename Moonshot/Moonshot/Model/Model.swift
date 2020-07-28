//
//  Model.swift
//  Moonshot
//
//  Created by Uday Pandey on 27/07/2020.
//

import Foundation
import SwiftUI

class Store: ObservableObject {
    @Published private(set) var missions: [Mission] = []
    @Published private(set) var astronauts: [Astronaut] = []

    init() {
        if let missions = Data.model([Mission].self, file: "missions"),
           let astronauts = Data.model([Astronaut].self, file: "astronauts") {
            self.missions = missions
            self.astronauts = astronauts

            print("Missions: \(missions)")
            print("Astronauts: \(astronauts)")

        }
    }
}

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}


struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: String?
    let crew: [Crew]
    let description: String

    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }


}

struct Crew: Codable {
    let name: String
    let role: String

}

extension Data {
    static func model<T: Codable>(_ type: T.Type, file: String) -> T? {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return nil
        }

        let jsonDecoder = JSONDecoder()

        do {
            let json = try jsonDecoder.decode(type, from: data)
            return json
        } catch {
            print("error: \(error)")
        }

        return nil
    }
}
