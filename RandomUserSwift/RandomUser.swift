//
//  RandomUser.swift
//  RandomUserSwift
//
//  Created by Wilson Ding on 10/10/16.
//  Copyright © 2016 Wilson Ding. All rights reserved.
//

import Foundation

/// Class that interacts with the RandomUser API to generate random users
public class RandomUser {

    /// Singleton
    public static let shared = RandomUser()

    /// API Version Number
    private static var apiVersion = 1.2

    /**
     Get one or more users from RandomUser API (https://www.randomuser.me/documentation)
     
     - parameter results: (optional) number of generated users to fetch in one request. Max is 5000. Default is 1.
     - parameter gender: (optional) specify whether you would like to have only male/female users generated.
     Valid values for the gender parameter are "male" or "female", or you may leave the parameter blank.
     Any other value will cause the service to return both male and female users. Default is both.
     - parameter nationality: (optional) specify nationality of generator users via comma separated values.
     Pictures won't be affected by this, but data such as location, cell/home phone, id, etc. will be more appropriate.
     Available nationalities for api v1.2 include: AU, BR, CA, CH, DE, DK, ES, FI, FR, GB, IE, IR, NO, NL, NZ, TR, US
     Default is random.
     */
    public func getUsers(results: Int = 1,
                         gender: String = "both",
                         nationality: String = "",
                         _ completionHandler: @escaping (_ data: Users?, _ error: Error?) -> Void) {

        guard let url = createUrl(results: results, gender: gender, nationality: nationality) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard
                error == nil,
                let data = data
            else {
                completionHandler(nil, error)
                return
            }

            let users = try? JSONDecoder().decode(Users.self, from: data)
            completionHandler(users, nil)
        }

        task.resume()
    }

    /// Create URL with config query parameters to use for RandomUser API
    private func createUrl(results: Int, gender: String, nationality: String) -> URL? {
        // swiftlint:disable line_length
        return URL(string: "https://randomuser.me/api/\(RandomUser.apiVersion)/?format=json&results=\(results)&gender=\(gender)&nat=\(nationality)")
    }

}
