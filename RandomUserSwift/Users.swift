//
//  Users.swift
//  RandomUserSwift
//
//  Created by Wilson Ding on 10/10/16.
//  Copyright © 2016 Wilson Ding. All rights reserved.
//

import Foundation

/// Codable Struct conforming to return payload from RandomUser API call
public struct Users: Codable {
    let results: [Result]?
    let info: Info?
}

struct Info: Codable {
    let seed: String?
    let results, page: Int?
    let version: String?
}

struct Result: Codable {
    let gender: Gender?
    let name: NameClass?
    let location: Location?
    let email: String?
    let login: Login?
    let dob, registered: Dob?
    let phone, cell: String?
    // swiftlint:disable identifier_name
    let id: ID?
    let picture: Picture?
    let nat: String?
}

struct Dob: Codable {
    let date: String?
    let age: Int?
}

enum Gender: String, Codable {
    case female
    case male
}

// swiftlint:disable type_name
struct ID: Codable {
    let name: NameEnum?
    let value: String?
}

enum NameEnum: String, Codable {
    case avs = "AVS"
    case bsn = "BSN"
    case cpr = "CPR"
    case dni = "DNI"
    case empty = ""
    // swiftlint:disable identifier_name
    case fn = "FN"
    case hetu = "HETU"
    case insee = "INSEE"
    case nino = "NINO"
    case pps = "PPS"
    case ssn = "SSN"
    case tfn = "TFN"
}

struct Location: Codable {
    let street, city, state: String?
    let postcode: Postcode?
    let coordinates: Coordinates?
    let timezone: Timezone?
}

struct Coordinates: Codable {
    let latitude, longitude: String?
}

enum Postcode: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Int.self) {
            self = .integer(value)
            return
        }
        if let value = try? container.decode(String.self) {
            self = .string(value)
            return
        }
        throw DecodingError.typeMismatch(Postcode.self,
                                         DecodingError.Context(codingPath: decoder.codingPath,
                                                               debugDescription: "Wrong type for Postcode"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}

struct Timezone: Codable {
    let offset, description: String?
}

struct Login: Codable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
}

struct NameClass: Codable {
    let title: Title?
    let first, last: String?
}

enum Title: String, Codable {
    case madame
    case mademoiselle
    case miss
    case monsieur
    // swiftlint:disable identifier_name
    case mr
    // swiftlint:enable identifier_name
    case mrs
    // swiftlint:disable identifier_name
    case ms
    // swiftlint:enable identifier_name
}

struct Picture: Codable {
    let large, medium, thumbnail: String?
}
