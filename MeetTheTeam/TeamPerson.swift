//
//  TeamPerson.swift
//  MeetTheTeam
//
//  Created by Mohamed Ayadi on 12/20/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

import UIKit

class TeamPerson{
    let avatar: String!
    let bio: String!
    let firstName: String!
    let id: String!
    let lastName: String!
    let title: String!
    
    init(passedAvatar: String,passedBio: String,passedFirstName: String,passedId: String,passedLastName: String,passedTitle: String) {
        self.avatar = passedAvatar
        self.bio = passedBio
        self.firstName = passedFirstName
        self.id = passedId
        self.lastName = passedLastName
        self.title = passedTitle
    }
}
