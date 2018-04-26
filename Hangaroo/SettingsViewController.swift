//
//  SettingsViewController.swift
//  Hangaroo
//
//  Created by Sayat Orazkulov on 24.07.17.
//  Copyright © 2018 Sayat. All rights reserved.
//

import Foundation
import UIKit
import Cartography

class SettingsViewController : UIViewController {
    
    private lazy var backgroundImage: UIImageView = {
        let my_image = UIImage(named: "back")
        let myImageView = UIImageView(image: my_image)
        return myImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
