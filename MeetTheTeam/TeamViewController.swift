//
//  TeamViewController.swift
//  MeetTheTeam
//
//  Created by Mohamed Ayadi on 12/20/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var passedPersons = [TeamPerson]()
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Meet The Team"
        initializeCollectionView()

    }
    
    //Collection View initialization
    func initializeCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 70, height: 70)
        
        let collectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
    }
    
    //Collection View Setup Delegate and datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return passedPersons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
}
