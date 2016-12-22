//
//  SelectedPersonViewController.swift
//  MeetTheTeam
//
//  Created by Mohamed Ayadi on 12/21/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

import UIKit

class SelectedPersonViewController: UIViewController {
    var passedPersons: TeamPerson!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        self.title = passedPersons.firstName + " " + passedPersons.lastName
        initializeImage()
        initializeBio()
    }
    
    func initializeImage(){
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 2)
        image.image = passedPersons.image
        self.view.addSubview(image)
    }
    
    func initializeBio() {
       let bioTextView = UITextView()
        bioTextView.isUserInteractionEnabled = false
        bioTextView.frame = CGRect(x: 0, y: self.view.frame.maxY / 2, width: self.view.frame.width, height: self.view.frame.height / 2)
        bioTextView.text = passedPersons.bio
        self.view.addSubview(bioTextView)
    }
}
