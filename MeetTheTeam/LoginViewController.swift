//
//  LoginViewController.swift
//  MeetTheTeam
//
//  Created by Mohamed Ayadi on 12/20/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    var persons = [TeamPerson]()
    var myTimer = Timer()
    
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
        loginButton.layer.cornerRadius = loginButton.bounds.size.width / 2
        loginButton.addTarget(self, action: #selector(loginbuttonPressed), for: .touchUpInside)
         self.view.addSubview(loginButton)
    }
    
    func loginbuttonPressed() {
        SVProgressHUD.show(withStatus: "I'm working on it")
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
        for person in json{
            if let avatar = person["avatar"] as? String {
                if let url = URL(string: avatar) {
                    self.persons.append(TeamPerson(passedAvatar: url, passedBio: person["bio"] as! String, passedFirstName: person["firstName"] as! String, passedId: person["id"] as! String, passedLastName: person["lastName"] as! String, passedTitle: person["title"] as! String))
                }
            }
        }
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(LoginViewController.checkPersonsImages), userInfo: nil, repeats: true)
    }
    
    func presentTeamViewScreen(){
        SVProgressHUD.showSuccess(withStatus: "Great Success")
        self.myTimer.invalidate()
        let teamView = TeamViewController()
        teamView.passedPersons = persons
        teamView.modalTransitionStyle = .flipHorizontal
        navigationController?.pushViewController(teamView, animated: true)
    }
    
    func checkPersonsImages(){
        if persons.last?.image != nil{
            self.presentTeamViewScreen()
        }
    }
  }
