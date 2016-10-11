//
//  ViewController.swift
//  RandomUserGenerator
//
//  Created by Wilson Ding on 10/10/16.
//  Copyright © 2016 Wilson Ding. All rights reserved.
//

import UIKit
import RandomUserSwift

class ViewController: UIViewController {
    
    var randomUser: RandomUser! = RandomUser()

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var saltLabel: UILabel!
    @IBOutlet weak var md5Label: UILabel!
    @IBOutlet weak var sha1Label: UILabel!
    @IBOutlet weak var sha256Label: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var registeredLabel: UILabel!
    @IBOutlet weak var homePhoneLabel: UILabel!
    @IBOutlet weak var cellPhoneLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNewRandomUser()
    }
    
    
    @IBAction func newUserButtonPressed(_ sender: AnyObject) {
        getNewRandomUser()
    }
    
    func getNewRandomUser() {
        randomUser.getUser { success, user in
            if success {
                if let randUser = user as? User {
                    // You can now access every aspect of the user.
                    
                    let imageUrl = URL(string: randUser.pictureLargeURL)
                    let imageData = try? Data(contentsOf: imageUrl!)
                    self.thumbnailImage.image = UIImage(data: imageData!)
                    
                    self.genderLabel.text = "Gender: \(randUser.gender)"
                    self.nameLabel.text = "Name: \(randUser.title.capitalizingFirstLetter()). \(randUser.firstName.capitalizingFirstLetter()) \(randUser.lastName.capitalizingFirstLetter())"
                    self.locationLabel.text = "Location: \(randUser.street) \(randUser.city) \(randUser.state) \(randUser.zip)"
                    self.emailLabel.text = "Email: \(randUser.email)"
                    self.usernameLabel.text = "Username: \(randUser.username)"
                    self.passwordLabel.text = "Password: \(randUser.password)"
                    self.saltLabel.text = "Salt: \(randUser.salt)"
                    self.md5Label.text = "md5: \(randUser.md5)"
                    self.sha1Label.text = "sha1: \(randUser.sha1)"
                    self.sha256Label.text = "sha256: \(randUser.sha256)"
                    self.dobLabel.text = "Date of Birth: \(randUser.dateOfBirth)"
                    self.registeredLabel.text = "Date Registered: \(randUser.dateRegistered)"
                    self.homePhoneLabel.text = "Home Phone: \(randUser.homePhone)"
                    self.cellPhoneLabel.text = "Cell Phone: \(randUser.cellPhone)"
                }
            }
        }
    }

}

extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
