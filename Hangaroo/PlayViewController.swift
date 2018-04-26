//
//  ViewController.swift
//  Hangaroo
//
//  Created by Sayat Orazkulov on 13.06.17.
//  Copyright © 2018 Sayat. All rights reserved.
//
import UIKit
import Cartography
import Alamofire

class PlayViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var myQuestion: Question?
    
    var letters = [String]()
    
    var question : String!
    var word_list = [String]()
    var cnt : Int = Int()
    var cnk : Int = Int()
    var instance : ThemesViewController!
    
    var tapped = [Bool]()
    var word = [String]()
    var space = [String]()
    var images = [UIImage]()
    var colors = [UIColor]()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 25, height: 25)
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var TopKeyboardCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TopKeyboardCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var layout2: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 25, height: 25)
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .horizontal
        
        return layout
    }()
    
    private lazy var BottomKeyboardCollectionView: UICollectionView = {
        let collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: self.layout2)
        collectionView2.dataSource = self
        collectionView2.delegate = self
        collectionView2.register(BottomKeyboardCollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
        collectionView2.backgroundColor = .clear
        return collectionView2
    }()
    
    private lazy var layout3: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 30, height: 30)
        layout.minimumInteritemSpacing = 3
        layout.scrollDirection = .vertical
        
        return layout
    }()
    
    private lazy var WordCollectionView: UICollectionView = {
        let collectionView3 = UICollectionView(frame: .zero, collectionViewLayout: self.layout3)
        collectionView3.dataSource = self
        collectionView3.delegate = self
        collectionView3.register(AnswerCollectionViewCell.self, forCellWithReuseIdentifier: "cell3")
        collectionView3.backgroundColor = .clear
        return collectionView3
    }()
    
    private lazy var treeImage : UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "tree")
        return view
    }()
    
    private lazy var headImage : UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "cleanFace")
        return view
    }()
    
    private lazy var faceImage : UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "face")
        return view
    }()
    
    private lazy var bodyImage : UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "body")
        return view
    }()
    
    private lazy var leftHandImage : UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "leftHand")
        return view
    }()
    
    private lazy var rightHandImage : UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "rightHand")
        return view
    }()
    
    private lazy var leftLegImage : UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "leftLeg")
        return view
    }()
    
    private lazy var rightLegImage : UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "rightLeg")
        return view
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "back")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    
        print(self.view.frame.width, self.view.frame.height)
        startGame()
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(backgroundImage)
        view.addSubview(TopKeyboardCollectionView)
        view.addSubview(BottomKeyboardCollectionView)
        view.addSubview(WordCollectionView)
        view.addSubview(treeImage)
        view.addSubview(headImage)
        view.addSubview(faceImage)
        view.addSubview(bodyImage)
        view.addSubview(leftHandImage)
        view.addSubview(rightHandImage)
        view.addSubview(leftLegImage)
        view.addSubview(rightLegImage)
    }
    
    func setupConstraints() {
        
        let topTree = 0.213 * self.view.frame.height
        let leadingTree = 0.03 * self.view.frame.width
        let frameTree = 0.693 * self.view.frame.height

        let leadingFace = 0.2624 * self.view.frame.width
        let topFace = 0.136 * self.view.frame.height
        let widthFace = 0.168 * self.view.frame.height
        let heightFace = 0.1573 * self.view.frame.height
        
        let leadingBody = 0.041 * self.view.frame.width
        let widthBody = 0.024 * self.view.frame.height
        let heightBody = 0.15 * self.view.frame.height
        
        let frameHand = 0.106 * self.view.frame.height
        
        let widthLeg = 0.0907 * self.view.frame.height
        let heightLeftLeg = 0.152 * self.view.frame.height
        let heightRightLeg = 0.16 * self.view.frame.height
        
        let pointsFace = 0.025 * self.view.frame.width
        let frameFace = 0.088 * self.view.frame.height
        
        constrain(view, backgroundImage, treeImage) {
            $1.top == $0.top
            $1.leading == $0.leading
            $1.trailing == $0.trailing
            $1.bottom == $0.bottom
            
            $2.top == $0.top + CGFloat(topTree)
            $2.leading == $0.leading + CGFloat(leadingTree)
            $2.width == CGFloat(frameTree)
            $2.height == CGFloat(frameTree)
        }
        
        constrain(treeImage, headImage, bodyImage, leftHandImage, rightHandImage) {
            $1.leading == $0.leading + CGFloat(leadingFace)
            $1.top == $0.top + CGFloat(topFace)
            $1.width == CGFloat(widthFace)
            $1.height == CGFloat(heightFace)
            
            $2.leading == $1.leading + CGFloat(leadingBody)
            $2.top == $1.bottom - 1
            $2.width == CGFloat(widthBody)
            $2.height == CGFloat(heightBody)
            
            $3.trailing == $2.leading// + 1
            $3.top == $1.bottom + 2
            $3.width == CGFloat(frameHand)
            $3.height == CGFloat(frameHand)
            
            $4.leading == $2.trailing
            $4.top == $1.bottom + 2
            $4.width == CGFloat(frameHand)
            $4.height == CGFloat(frameHand)
        }
        
        constrain(bodyImage, leftLegImage, rightLegImage) {
            $1.top == $0.bottom - 4
            $1.trailing == $0.leading + 3
            $1.width == widthLeg
            $1.height == heightLeftLeg
            
            $2.top == $1.top
            $2.leading == $0.trailing - 4
            $2.width == widthLeg
            $2.height == heightRightLeg
        }
        
        constrain(headImage,faceImage) {
            $1.top == $0.top + pointsFace
            $1.leading == $0.leading + CGFloat(pointsFace)
            $1.width == frameFace
            $1.height == frameFace
        }
        
        let pointCollectionView = 0.15625 * self.view.frame.height
        let trailingCollectionView = 0.0625 * self.view.frame.height
        
        constrain(view, TopKeyboardCollectionView, BottomKeyboardCollectionView, WordCollectionView) {
            
            $3.top == $0.top + pointCollectionView
            $3.centerX == $0.centerX + 10
            $3.width == CGFloat(200)
            $3.height == CGFloat(40)
//            $3.leading == $0.leading + (5 * pointCollectionView)
//            $3.trailing == $0.trailing - trailingCollectionView
//            $3.bottom == $0.bottom - (5 * pointCollectionView)
            
            $1.top == $3.bottom + trailingCollectionView//20
//            $1.leading == $0.leading + (16 * trailingCollectionView)//300
            $1.trailing == $0.trailing - trailingCollectionView
            $1.width == CGFloat(300)
            $1.height == CGFloat(150)
//            $1.bottom == $0.bottom - 110//(6 * trailingCollectionView)//120
            
            $2.top == $1.bottom + 3
            //$2.leading == $0.leading + (17 * trailingCollectionView)//340
            $2.centerX == $1.centerX + 10// - 10
            $2.width == CGFloat(300)
            $2.height == CGFloat(40)
//            $2.trailing == $0.trailing - (2 * trailingCollectionView)
//            $2.bottom == $0.bottom - 70//(4 * trailingCollectionView)
        }
        
        
    }
    
    func setupListOfLetters() {
        
        for i in 0 ..< 41 {
            letters.append(takeLetter(x: i))
            tapped.append(false)
            images.append(#imageLiteral(resourceName: "black"))
            colors.append(.black)
        }
        
        for i in 0 ..< word_list.count {
            if word_list[i] != " " || word_list[i] != "-" {
                space.append("_")
            } else {
                space.append(word_list[i])
            }
        }
    }
    
    func startGame() {
        let index = Int(arc4random_uniform(UInt32(word.count)))
        question = word[index]
        
        letters = []
        tapped = []
        images = []
        colors = []
        space = []
        word_list = []
        cnt = 0
        
        headImage.isHidden = true
        faceImage.isHidden = true
        bodyImage.isHidden = true
        leftHandImage.isHidden = true
        rightHandImage.isHidden = true
        leftLegImage.isHidden = true
        rightLegImage.isHidden = true
    
        word_list = fromStringToList(question: question)
        setupListOfLetters()
    
        TopKeyboardCollectionView.reloadData()
        BottomKeyboardCollectionView.reloadData()
        WordCollectionView.reloadData()
        
        if (question.characters.count > 4) {
            for _ in 0 ..< 2 {
                var index = Int(arc4random_uniform(UInt32(question.characters.count)))
                let varr = word_list[index]
                
                for index in 0 ..< word_list.count {
                    if word_list[index] == varr {
                        space[index] = varr
                    }
                }
                
                
                index = letters.index(of: varr)!
                
                colors[index] = .green
                images[index] = #imageLiteral(resourceName: "green")
                tapped[index] = true
            }
        }

    }
    
    func correctAnswer(count: Int) {
        
        switch self.word_list.count {
        case count:
            
            let alert = UIAlertController(title: "You win!", message: "Do you want to try again?", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in
                self.startGame()
            }))
            
            alert.addAction(UIAlertAction(title: "No!", style: UIAlertActionStyle.default, handler : { action in
                let nvc : UINavigationController = self.navigationController!
                nvc.popViewController(animated: true)
            }))
            
            self.present(alert, animated: true, completion: nil)

        default:
            break
        }
    }
    
    func wrongAnswer(count: Int) {
        
        switch count {
        case 1:
            UIView.animate(withDuration: 0.9) {
//                self.car.center.y -= CGFloat(150)
                self.headImage.isHidden = false
            }
        case 2:
            UIView.animate(withDuration: 0.9) {
//                self.girl.center.x += CGFloat(140)
                self.bodyImage.isHidden = false
            }
        case 3:
            UIView.animate(withDuration: 0.9) {
//                self.car.image = #imageLiteral(resourceName: "opened")
                self.leftHandImage.isHidden = false
            }
        case 4:
            UIView.animate(withDuration: 0.9) {
//                self.girl.center.x += CGFloat(15)
//                self.girl.isHidden = true
//                self.car.image = #imageLiteral(resourceName: "closed")
                self.rightHandImage.isHidden = false
            }
        case 5:
            UIView.animate(withDuration: 0.9) {
                //self.car.center.y -= CGFloat(400)
                self.leftLegImage.isHidden = false
            }
//        case 6:
//            UIView.animate(withDuration: 0.5) {
////                self.leftLegHidder.isHidden = true
//            }
        case 6:
            UIView.animate(withDuration: 0.5) {
                UIView.animate(withDuration: 0.5) {
                    self.rightLegImage.isHidden = false
                    self.faceImage.isHidden = false
                }
                
                UIView.animate(withDuration: 0.5) {
                    for i in 0..<self.word_list.count {
                        self.space[i] = self.word_list[i]
                    }
                    self.WordCollectionView.reloadData()
                }
                
                let alert = UIAlertController(title: "Game Over!", message: "", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default, handler: { action in
                    self.startGame()
                }))
                
                alert.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.default, handler : { action in
                    let nvc : UINavigationController = self.navigationController!
                    nvc.popViewController(animated: true)
                }))
                
                self.present(alert, animated: true, completion: nil)

            }
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = 0
        if collectionView == self.TopKeyboardCollectionView {
            count = 35
        } else if collectionView == self.BottomKeyboardCollectionView {
            count = 6
        } else if collectionView == self.WordCollectionView {
            count = question.characters.count
        }
        return count
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (collectionView == self.TopKeyboardCollectionView)
        {
            if (question.contains(letters[indexPath.row]) && !tapped[indexPath.row])
            {
                for i in 0 ..< word_list.count
                {
                    if word_list[i] == letters[indexPath.row]
                    {
                        space[i] = letters[indexPath.row]
                        images[indexPath.row] = #imageLiteral(resourceName: "green")
                        colors[indexPath.row] = .green
                        tapped[indexPath.row] = true
                        
                        cnk = 0
                        cnk = space.reduce(0) { $1 != "_" ? $0 + 1 : $0}
                        correctAnswer(count: cnk)
                        WordCollectionView.reloadData()
                    }
                }
            } else if (!tapped[indexPath.row])
            {
                images[indexPath.row] = #imageLiteral(resourceName: "pink")
                colors[indexPath.row] = UIColor.init(red: 237, green: 167, blue: 194, alpha: 1.0)
                tapped[indexPath.row] = true
                cnt += 1
                wrongAnswer(count: cnt)
            }
            TopKeyboardCollectionView.reloadData()
            
        } else if (collectionView == self.BottomKeyboardCollectionView) {
            if (question.contains(letters[indexPath.row + 35]) && !tapped[indexPath.row + 35]) {
                for i in 0 ..< word_list.count {
                    if word_list[i] == letters[indexPath.row + 35] {
                        space[i] = letters[indexPath.row + 35]
                        images[indexPath.row + 35] = #imageLiteral(resourceName: "green")
                        colors[indexPath.row + 35] = .green
                        tapped[indexPath.row + 35] = true
                        cnk = 0
                        cnk = space.reduce(0) { $1 != "_" ? $0 + 1 : $0}
                        correctAnswer(count: cnk)
                        WordCollectionView.reloadData()
                    }
                }
            } else if !tapped[indexPath.row + 35]
            {
                images[indexPath.row + 35] = #imageLiteral(resourceName: "pink")
                colors[indexPath.row + 35] = UIColor.init(red: 237, green: 167, blue: 194, alpha: 1)
                tapped[indexPath.row + 35] = true
                cnt += 1
                wrongAnswer(count: cnt)
            }
            BottomKeyboardCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.TopKeyboardCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopKeyboardCollectionViewCell
            cell.textLabel.text = letters[indexPath.row]
            cell.textLabel.textColor = colors[indexPath.row]
            cell.textLabel.font = UIFont(name: "TrashHand", size: 16.0)
            cell.imageView.image = images[indexPath.row]
            return cell
        } else if collectionView == self.WordCollectionView {
            let cell = WordCollectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! AnswerCollectionViewCell
            cell.textLabel.text = space[indexPath.row]
            cell.textLabel.font = UIFont(name: "TrashHand", size: 18.0)
            cell.backgroundColor = .clear
            return cell
        } else {
            let cell = BottomKeyboardCollectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! BottomKeyboardCollectionViewCell
            cell.textLabel.text = letters[indexPath.row + 35]
            cell.textLabel.textColor = colors[indexPath.row + 35]
            cell.textLabel.font = UIFont(name: "TrashHand", size: 16.0)
            cell.imageView.image = images[indexPath.row + 35]
            return cell
        }
    }
}




