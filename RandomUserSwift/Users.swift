//
//  Users.swift
//  RandomUserSwift
//
//  Created by Wilson Ding on 10/10/16.
//  Copyright © 2016 Wilson Ding. All rights reserved.
//

import Foundation

public struct Users: Codable {
    let results: [Result]
    let info: Info
}

struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

struct Result: Codable {
    let gender: Gender
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

struct Dob: Codable {
    let date: Date
    let age: Int
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

struct ID: Codable {
    let name: String
    let value: String?
}

struct Location: Codable {
    let street, city, state: String
    let postcode: Postcode
    let coordinates: Coordinates
    let timezone: Timezone
}

struct Coordinates: Codable {
    let latitude, longitude: String
}

enum Postcode: Codable {
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Postcode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Postcode"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

struct Timezone: Codable {
    let offset, description: String
}

struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

struct Name: Codable {
    let title: Title
    let first, last: String
}

enum Title: String, Codable {
    case madame = "madame"
    case miss = "miss"
    case monsieur = "monsieur"
    case mr = "mr"
    case mrs = "mrs"
    case ms = "ms"
}

struct Picture: Codable {
    let large, medium, thumbnail: String
}
