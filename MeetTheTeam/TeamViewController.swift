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
        self.title = "Meet The Team"
        initializeCollectionView()

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
        return cell
    }
    
}
