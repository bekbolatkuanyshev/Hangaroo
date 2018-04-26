//
//  ThemesListCollectionViewCell.swift
//  Hangaroo
//
//  Created by Sayat Orazkulov on 13.06.17.
//  Copyright © 2018 Sayat. All rights reserved.
//

import Foundation
import UIKit
import Cartography

class ThemesListCollectionViewCell: UICollectionViewCell {
    
    var textLabel = UILabel()
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
        
        constrain(textLabel, contentView, imageView) {
            $2.center == $1.center
            $2.edges == $1.edges
            $0.center == $2.center
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
