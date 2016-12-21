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
    
    func loginbuttonPressed() {
        configJASON(json: readJSON())
    }
    
    func readJSON() -> [[String:AnyObject]]! {
        let url = Bundle.main.url(forResource: "team", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:AnyObject]]
             return object!
        } catch {
            // Handle error here
            return nil
        }
    }
    
    func configJASON(json: [[String:AnyObject]]) {
        var persons = [TeamPerson]()
        for person in json{
            if let avatar = person["avatar"] as? String {
                if let url = URL(string: avatar) {
                  persons.append(TeamPerson(passedAvatar: downloadImage(url: url), passedBio: person["bio"] as! String, passedFirstName: person["firstName"] as! String, passedId: person["id"] as! String, passedLastName: person["lastName"] as! String, passedTitle: person["title"] as! String))
                }
            }
        }
    }
    
    func downloadImage(url: URL) -> UIImage {
        var data: Data!
        DispatchQueue.global().async {
            data = try? Data(contentsOf: url)
        }
         return UIImage(data: data!)!
       
    }
    
    func presentTeamViewScreen(){
        let teamView = TeamViewController()
        teamView.modalTransitionStyle = .flipHorizontal
        navigationController?.pushViewController(teamView, animated: true)
    }
  }
