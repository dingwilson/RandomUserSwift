//
//  User.swift
//  RandomUserSwift
//
//  Created by Wilson Ding on 10/10/16.
//  Copyright © 2016 Wilson Ding. All rights reserved.
//

import Foundation

public class User : NSObject {
    public var gender: String
    public var title: String
    public var firstName: String
    public var lastName: String
    public var street: String
    public var city: String
    public var state: String
    public var zip: Int
    public var email: String
    public var username: String
    public var password: String
    public var salt: String
    public var md5: String
    public var sha1: String
    public var sha256: String
    public var dateOfBirth: Date
    public var dateRegistered: Date
    public var homePhone: String
    public var cellPhone: String
    public var pictureLargeURL: String
    public var pictureMediumURL: String
    public var pictureThumbnailURL: String
    
    public init(gender: String, title: String, firstName: String, lastName: String, street: String, city: String, state: String, zip: Int, email: String, username: String, password: String, salt: String, md5: String, sha1: String, sha256: String, dateOfBirth: Date, dateRegistered: Date, homePhone: String, cellPhone: String, pictureLargeURL: String, pictureMediumURL: String, pictureThumbnailURL: String) {
        self.gender = gender
        self.title = title
        self.firstName = firstName
        self.lastName = lastName
        self.street = street
        self.city = city
        self.state = state
        self.zip = zip
        self.email = email
        self.username = username
        self.password = password
        self.salt = salt
        self.md5 = md5
        self.sha1 = sha1
        self.sha256 = sha256
        self.dateOfBirth = dateOfBirth
        self.dateRegistered = dateRegistered
        self.homePhone = homePhone
        self.cellPhone = cellPhone
        self.pictureLargeURL = pictureLargeURL
        self.pictureMediumURL = pictureMediumURL
        self.pictureThumbnailURL = pictureThumbnailURL
    }
    
}
