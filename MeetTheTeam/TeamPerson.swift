//
//  TeamPerson.swift
//  MeetTheTeam
//
//  Created by Mohamed Ayadi on 12/20/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

import UIKit

class TeamPerson{
    let avatar: URL!
    let bio: String!
    let firstName: String!
    let id: String!
    let lastName: String!
    let title: String!
    var image: UIImage!
    
    init(passedAvatar: URL, passedBio: String, passedFirstName: String, passedId: String, passedLastName: String, passedTitle: String) {
        self.avatar = passedAvatar
        self.bio = passedBio
        self.firstName = passedFirstName
        self.id = passedId
        self.lastName = passedLastName
        self.title = passedTitle
        downloadImage(url: passedAvatar)
    }
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.image = UIImage(data: data)
            }
        }
    }
}
