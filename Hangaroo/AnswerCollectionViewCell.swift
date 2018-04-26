//
//  AnswerCollectionViewCell.swift
//  Hangaroo
//
//  Created by Sayat Orazkulov on 13.06.17.
//  Copyright © 2018 Sayat. All rights reserved.
//

import Foundation
import Cartography

class AnswerCollectionViewCell: UICollectionViewCell {
    
    var textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(textLabel)
        
        constrain(textLabel, contentView) {
            $0.center == $1.center
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
