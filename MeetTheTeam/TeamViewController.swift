//
//  TeamViewController.swift
//  MeetTheTeam
//
//  Created by Mohamed Ayadi on 12/20/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var passedPersons = [TeamPerson]()
    var tableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        self.title = "Meet The Team"
        initializeCollectionView()
        passedPersons = passedPersons.sorted { $0.title < $1.title }

    }
    
    //tableView initialization
    func initializeCollectionView() {
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
    }
    
    //tableView Setup Delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passedPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle,reuseIdentifier: "cell")
        cell.textLabel?.text = passedPersons[indexPath.row].firstName + " " + passedPersons[indexPath.row].lastName
        cell.detailTextLabel?.text = passedPersons[indexPath.row].title
        cell.imageView?.image = passedPersons[indexPath.row].image
        cell.layer.cornerRadius = cell.layer.frame.width / 6
        cell.layer.masksToBounds = true
        cell.backgroundColor = getRandomColor()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    //Function that generates randon color
    func getRandomColor() -> UIColor{
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}
