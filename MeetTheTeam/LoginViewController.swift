//
//  LoginViewController.swift
//  MeetTheTeam
//
//  Created by Mohamed Ayadi on 12/20/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login page"
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "coffeeAndBagel")!)
        initializeLoginButton()
        
    }

    func initializeLoginButton() {
        let loginButton = UIButton(type: .custom)
        loginButton.backgroundColor = UIColor.red
        loginButton.setTitle("Login", for: .normal)
        loginButton.frame = CGRect(x: view.frame.width / 4, y: view.frame.height * 3/4, width: view.frame.width / 2, height: 50)
        loginButton.addTarget(self, action: #selector(loginbuttonPressed), for: .touchUpInside)
         self.view.addSubview(loginButton)
    }
    
    func loginbuttonPressed(){
        let teamView = TeamViewController()
        teamView.modalTransitionStyle = .flipHorizontal
        navigationController?.pushViewController(teamView, animated: true)
        readJSON()
    }
    
    func readJSON() {
        var json: [[String:AnyObject]]?
        let url = Bundle.main.url(forResource: "team", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:AnyObject]]
            json = object
        } catch {
            // Handle error here
        }
    }
  }
