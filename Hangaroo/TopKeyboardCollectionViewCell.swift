//
//  NumbersCollectionViewCell.swift
//  Hangaroo
//
//  Created by Sayat Orazkulov on 13.06.17.
//  Copyright © 2018 Sayat. All rights reserved.
//

import UIKit
import Cartography

class TopKeyboardCollectionViewCell: UICollectionViewCell {
    
    var textLabel = UILabel()
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        //imageView.image = #imageLiteral(resourceName: "black")
        contentView.addSubview(textLabel)
        
        constrain(textLabel, contentView, imageView) {
            $2.center == $1.center
            $2.size == $1.size
            $0.center == $2.center
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
