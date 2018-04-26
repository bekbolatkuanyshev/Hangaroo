//
//  Themes.swift
//  Hangaroo
//
//  Created by Sayat Orazkulov on 13.06.17.
//  Copyright © 2018 Sayat. All rights reserved.
//

import UIKit
import Cartography
import ObjectMapper

class ThemesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var questions = [Question]()
    var layoutLineSpacing = CGFloat()
    var layoutItemSpacing = CGFloat()
    var layoutWidth = CGFloat()
    var layoutHeight = CGFloat()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.layoutWidth, height: self.layoutHeight)
        layout.minimumInteritemSpacing = self.layoutItemSpacing
        layout.minimumLineSpacing = self.layoutLineSpacing
        layout.scrollDirection = .vertical
        return layout
    }()
    
    private lazy var themesCollectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ThemesListCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "back")
        //view.contentMode = .scaleToFill
        return view
    }()
    
    override func viewDidLoad() {
        
        layoutWidth = 0.5625 * self.view.frame.height
        layoutHeight = 0.125 * self.view.frame.height
        layoutItemSpacing = 0.3125 * self.view.frame.height
        layoutLineSpacing = 0.09375 * self.view.frame.height
        
        self.view.backgroundColor = .white
        questions = Question.fetchQuestions()
        print(self.view.frame.width, self.view.frame.height)
        setupViews()
        setupConstraints()
    }
    
    
    func setupViews() {
        view.addSubview(backgroundImage)
        view.addSubview(themesCollectionView)
    }
    
    func setupConstraints() {
        constrain(view, themesCollectionView, backgroundImage) {
            $1.top == $0.top + 70
            $1.leading == $0.leading + 25
            $1.trailing == $0.trailing - 25
            $1.bottom == $0.bottom - 50
            
            $2.top == $0.top
            $2.leading == $0.leading
            $2.trailing == $0.trailing
            $2.bottom == $0.bottom
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newViewController = PlayViewController()
        navigationController?.pushViewController(newViewController, animated: true)
        newViewController.word = questions[indexPath.row].text
        newViewController.instance = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ThemesListCollectionViewCell
        cell.textLabel.text = questions[indexPath.row].level
        cell.textLabel.font = UIFont(name: "TrashHand", size: 16.0)
        cell.imageView.image = #imageLiteral(resourceName: "cell")
        cell.backgroundColor = .red
        return cell
    }
    
}
