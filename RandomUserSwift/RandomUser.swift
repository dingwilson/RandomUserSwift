//
//  RandomUser.swift
//  RandomUserSwift
//
//  Created by Wilson Ding on 10/10/16.
//  Copyright © 2016 Wilson Ding. All rights reserved.
//

import Foundation

public class RandomUser {
    
    public var gender: String?
    public var nationality: String?
    
    private var user: User!
    private var url = URL(string: "http://api.randomuser.me/?format=json&noinfo")!
    
    public init() {
        self.gender = "both"
        self.nationality = "us"
    }
    
    public func getUser(completionHandler: @escaping (_ success: Bool, _ user: AnyObject) -> ()) {
        
        self.createURL()
        
        self.getRandomUser(url: url) { (success, user) -> () in
            if success {
                completionHandler(true, self.user)
            }
                
            else {
                completionHandler(false, "" as AnyObject)
            }
        }
    }
    
    private func createURL() {
        var stringURL = "http://api.randomuser.me/?format=json&noinfo"
        
        if let gender = gender {
            if gender == "female" {
                stringURL = stringURL + "&gender=female"
            } else if gender == "male" {
                stringURL = stringURL + "&gender=male"
            } else {
                //Do Nothing. Either Both or Improper Response
            }
        }
        
        else {
            print("Gender cannot be nil")
        }
        
        if let nationality = nationality {
            stringURL = stringURL + "&nat=\(nationality)"
        }
        
        else {
            print("Nationality cannot be nil")
        }
        
        self.url = URL(string: stringURL)!
    }
    
    private func getRandomUser(url: URL, completionHandler: @escaping (_ success: Bool, _ user: AnyObject) -> ()){
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            self.parseResult(json: json! as AnyObject){ (success) -> () in
                DispatchQueue.main.async(execute: { () -> Void in
                    if success {
                        completionHandler(true, self.user)
                    }
                        
                    else {
                        completionHandler(false, "" as AnyObject)
                    }
                })
            }
        }
        task.resume()
    }
    
    /* EXAMPLE JSON RESPONSE:
     {
     "results": [
     {
     "gender": "male",
     "name": {
     "title": "mr",
     "first": "romain",
     "last": "hoogmoed"
     },
     "location": {
     "street": "1861 jan pieterszoon coenstraat",
     "city": "maasdriel",
     "state": "zeeland",
     "postcode": 69217
     },
     "email": "romain.hoogmoed@example.com",
     "login": {
     "username": "lazyduck408",
     "password": "jokers",
     "salt": "UGtRFz4N",
     "md5": "6d83a8c084731ee73eb5f9398b923183",
     "sha1": "cb21097d8c430f2716538e365447910d90476f6e",
     "sha256": "5a9b09c86195b8d8b01ee219d7d9794e2abb6641a2351850c49c309f1fc204a0"
     },
     "dob": "1983-07-14 07:29:45",
     "registered": "2010-09-24 02:10:42",
     "phone": "(656)-976-4980",
     "cell": "(065)-247-9303",
     "id": {
     "name": "BSN",
     "value": "04242023"
     },
     "picture": {
     "large": "https://randomuser.me/api/portraits/men/83.jpg",
     "medium": "https://randomuser.me/api/portraits/med/men/83.jpg",
     "thumbnail": "https://randomuser.me/api/portraits/thumb/men/83.jpg"
     },
     "nat": "NL"
     }
     ],
     "info": {
     "seed": "2da87e9305069f1d",
     "results": 1,
     "page": 1,
     "version": "1.1"
     }
     }
     */
    
    private func parseResult(json: AnyObject, completion: @escaping (_ success: Bool) -> ()){
        if let results = json["results"] as? [[String: AnyObject]] {
            
            for result in results {
                let gender = result["gender"]! as! String
                
                let title = result["name"]!["title"]! as! String
                let firstName = result["name"]!["first"]! as! String
                let lastName = result["name"]!["last"]! as! String
                
                let street = result["location"]!["street"]! as! String
                let city = result["location"]!["city"]! as! String
                let state = result["location"]!["state"]! as! String
                let zip = Int(result["location"]!["postcode"]! as! NSNumber)
                
                let email = result["email"]! as! String
                
                let username = result["login"]!["username"]! as! String
                let password = result["login"]!["password"]! as! String
                
                let salt = result["login"]!["salt"]! as! String
                let md5 = result["login"]!["md5"]! as! String
                let sha1 = result["login"]!["sha1"]! as! String
                let sha256 = result["login"]!["sha256"]! as! String
                
                let dateOfBirth = convertTo(date: result["dob"]! as! String)
                
                let dateRegistered = convertTo(date: result["registered"]! as! String)
                
                let homePhone = result["phone"]! as! String
                
                let cellPhone = result["cell"]! as! String
                
                let pictureLargeURL = result["picture"]!["large"]! as! String
                let pictureMediumURL = result["picture"]!["medium"]! as! String
                let pictureThumbnailURL = result["picture"]!["thumbnail"]! as! String
                
                self.user = User(gender: gender, title: title, firstName: firstName, lastName: lastName, street: street, city: city, state: state, zip: zip, email: email, username: username, password: password, salt: salt, md5: md5, sha1: sha1, sha256: sha256, dateOfBirth: dateOfBirth, dateRegistered: dateRegistered, homePhone: homePhone, cellPhone: cellPhone, pictureLargeURL: pictureLargeURL, pictureMediumURL: pictureMediumURL, pictureThumbnailURL: pictureThumbnailURL)
            }
            
            completion(true)
        }
            
        else {
            print("Error! Unable to parse the JSON response")
            completion(false)
        }
    }
    
    private func convertTo(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH-mm-ss"
        return dateFormatter.date(from: date)!
    }
}
